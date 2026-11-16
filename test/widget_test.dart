// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets(
    'MyPortfolio menampilkan identitas dan tiga tombol',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('MyPortfolio'), findsOneWidget);
      expect(find.text('2506537915'), findsOneWidget);
      expect(find.text('Annisa Saskya Aulia'), findsOneWidget);
      expect(find.text('PBP C'), findsOneWidget);

      expect(find.text('Lihat Proyek'), findsOneWidget);
      expect(find.text('Tambah Proyek'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    },
  );

  testWidgets(
    'Tombol Lihat Proyek menampilkan SnackBar',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Lihat Proyek'));
      await tester.pump();
      await tester.pump(
        const Duration(milliseconds: 300),
      );

      expect(
        find.text(
          'Kamu telah menekan tombol Lihat Proyek!',
        ),
        findsOneWidget,
      );
    },
  );
}
