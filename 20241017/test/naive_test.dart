import 'package:test/test.dart';
import 'package:leetcode20241017/lib/naive.dart';

void main() {
    test('Basic test - simple target without dead ends', () {
        expect(minMovesToUnlock('010', []), equals(1));
    });

    test('Basic test - dead ends block the path', () {
        expect(minMovesToUnlock('010', ['010']), equals(null));
    });

    test('Complex test - multiple moves and dead ends', () {
        expect(minMovesToUnlock('020', ['010', '012', '021']), equals(4));
    });

    test('Target is already the initial state', () {
        expect(minMovesToUnlock('000', []), equals(0));
    });

    test('Impossible case - dead ends surround the initial state', () {
        expect(minMovesToUnlock('001', ['001', '009', '100', '900']), equals(null));
    });
}

