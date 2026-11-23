import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

/// Halaman formulir untuk menambah pengalaman (magang, organisasi, dll).
class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _companyController = TextEditingController();
  final _positionController = TextEditingController();
  final _startController = TextEditingController();
  final _endController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _linkController = TextEditingController();

  static const List<String> _types = [
    'Magang',
    'Organisasi',
    'Kepanitiaan',
    'Pekerjaan',
  ];

  String _type = _types.first;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isOngoing = false;

  @override
  void dispose() {
    _companyController.dispose();
    _positionController.dispose();
    _startController.dispose();
    _endController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  // ---------- Helper ----------

  String _formatDate(DateTime d) {
    final day = d.day.toString().padLeft(2, '0');
    final month = d.month.toString().padLeft(2, '0');
    return '$day/$month/${d.year}';
  }

  Future<void> _pickDate({required bool isStart}) async {
    final current = isStart ? _startDate : _endDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;

    setState(() {
      if (isStart) {
        _startDate = picked;
        _startController.text = _formatDate(picked);
      } else {
        _endDate = picked;
        _endController.text = _formatDate(picked);
      }
    });
  }

  // ---------- Validator ----------

  String? _validateRequired(String? value, String label, {int max = 60}) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return '$label tidak boleh kosong';
    if (text.length > max) return '$label maksimal $max karakter';
    return null;
  }

  String? _validateDescription(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Deskripsi tidak boleh kosong';
    if (text.length < 10) return 'Deskripsi minimal 10 karakter';
    if (text.length > 200) return 'Deskripsi maksimal 200 karakter';
    return null;
  }

  String? _validateStart(String? value) {
    if (_startDate == null) return 'Tanggal mulai wajib dipilih';
    return null;
  }

  String? _validateEnd(String? value) {
    if (_isOngoing) return null;
    if (_endDate == null) {
      return 'Pilih tanggal selesai atau aktifkan "Masih berlangsung"';
    }
    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
      return 'Tanggal selesai tidak boleh sebelum tanggal mulai';
    }
    return null;
  }

  String? _validateLink(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return null; // opsional
    final uri = Uri.tryParse(text);
    final valid = uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
    return valid ? null : 'Format tautan tidak valid (contoh: https://contoh.com)';
  }

  // ---------- Simpan ----------

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final link = _linkController.text.trim();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Pengalaman Tersimpan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Institusi: ${_companyController.text.trim()}'),
                const SizedBox(height: 8),
                Text('Posisi: ${_positionController.text.trim()}'),
                const SizedBox(height: 8),
                Text('Jenis: $_type'),
                const SizedBox(height: 8),
                Text('Mulai: ${_startController.text}'),
                const SizedBox(height: 8),
                Text(
                  'Selesai: ${_isOngoing ? "Masih berlangsung" : _endController.text}',
                ),
                const SizedBox(height: 8),
                Text('Deskripsi: ${_descriptionController.text.trim()}'),
                const SizedBox(height: 8),
                Text('Tautan: ${link.isEmpty ? "-" : link}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  // ---------- UI ----------

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengalaman'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _companyController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Nama Institusi',
                    hintText: 'Contoh: Tokopedia',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => _validateRequired(v, 'Nama institusi'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _positionController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Posisi / Peran',
                    hintText: 'Contoh: Mobile Developer Intern',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => _validateRequired(v, 'Posisi'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _type,
                  decoration: const InputDecoration(
                    labelText: 'Jenis Pengalaman',
                    border: OutlineInputBorder(),
                  ),
                  items: _types
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (v) => setState(() => _type = v!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _startController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: true),
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Mulai',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateStart,
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Masih berlangsung'),
                  value: _isOngoing,
                  onChanged: (value) {
                    setState(() {
                      _isOngoing = value;
                      if (value) {
                        _endDate = null;
                        _endController.clear();
                      }
                    });
                  },
                ),
                TextFormField(
                  controller: _endController,
                  readOnly: true,
                  enabled: !_isOngoing,
                  onTap: () => _pickDate(isStart: false),
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Selesai',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateEnd,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    hintText: 'Ceritakan tugas dan pencapaianmu',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateDescription,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _linkController,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'Tautan (opsional)',
                    hintText: 'https://contoh.com',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateLink,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}