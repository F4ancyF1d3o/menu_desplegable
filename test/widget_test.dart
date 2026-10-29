import 'package:flutter_test/flutter_test.dart';
import 'package:bottom_navigation_demo/main.dart';

void main() {
  testWidgets('muestra un saludo para la sección seleccionada', (tester) async {
    await tester.pumpWidget(const MessagingDemoApp());

    expect(find.text('Bienvenido a Business'), findsOneWidget);

    await tester.tap(find.text('Home').last);
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido a Home'), findsOneWidget);

    await tester.tap(find.text('School'));
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido a School'), findsOneWidget);

    await tester.tap(find.text('Contabilidad'));
    await tester.pumpAndSettle();
    expect(find.text('Bienvenido a Contabilidad'), findsOneWidget);
  });
}
