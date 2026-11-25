import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Kartu aksi membuka form pengalaman', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));

    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pumpAndSettle();

    expect(find.text('Form Pengalaman'), findsOneWidget);
  });

  testWidgets('Simpan dengan input kosong menampilkan error', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));
    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Simpan'));
    await tester.tap(find.text('Simpan'));
    await tester.pump();

    expect(find.text('Nama institusi tidak boleh kosong'), findsOneWidget);
    expect(find.text('Pengalaman Tersimpan!'), findsNothing);
  });

  testWidgets('Drawer punya opsi Add Experience', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    expect(find.text('Add Experience'), findsOneWidget);
  });
}
