import 'package:test/test.dart';
import 'package:leetcode20241024/naive.dart';

void main() {
  test('single node tree', () {
    final a = TreeNode();
    expect(
      findMaxPathLengthInTreeHelper(a),
      equals(0),
    );
  });

  test('linear path tree', () {
    //    a
    //    |
    //    b  (weight 2)
    //    |
    //    c  (weight 3)
    final a = TreeNode();
    final b = TreeNode();
    final c = TreeNode();
    a.addChild(b, 2);
    b.addChild(c, 3);
    expect(
      findMaxPathLengthInTreeHelper(a),
      equals(5),
    );
  });

  test('star topology', () {
    //      a
    //    / | \
    //   b  c  d
    // weights: 2, 5, 3
    final a = TreeNode();
    final b = TreeNode();
    final c = TreeNode();
    final d = TreeNode();
    a.addChild(b, 2);
    a.addChild(c, 5);
    a.addChild(d, 3);
    expect(
      findMaxPathLengthInTreeHelper(a),
      equals(8),
    ); // should be path c->a->b
  });

  test('unival tree (all weights = 1)', () {
    //      a
    //    / | \
    //   b  c  d
    //  /       \
    // e         f
    final a = TreeNode();
    final b = TreeNode();
    final c = TreeNode();
    final d = TreeNode();
    final e = TreeNode();
    final f = TreeNode();

    a.addChild(b, 1);
    a.addChild(c, 1);
    a.addChild(d, 1);
    b.addChild(e, 1);
    d.addChild(f, 1);

    expect(findMaxPathLengthInTreeHelper(a), equals(4)); // e->b->a->d->f
  });

  test('tie break with ascending vs descending weights', () {
    //       a
    //      / \
    //     b   c
    //    /     \
    //   d       e
    //  /         \
    // f           g
    final a = TreeNode();
    final b = TreeNode();
    final c = TreeNode();
    final d = TreeNode();
    final e = TreeNode();
    final f = TreeNode();
    final g = TreeNode();

    // Left path: ascending 1,2,3
    a.addChild(b, 1);
    b.addChild(d, 2);
    d.addChild(f, 3);

    // Right path: descending 3,2,1
    a.addChild(c, 3);
    c.addChild(e, 2);
    e.addChild(g, 1);

    expect(findMaxPathLengthInTreeHelper(a), equals(12)); // f->d->b->a->c->e->g
  });

  test('large weight at bottom', () {
    //    a
    //   / \
    //  b   c
    //     / \
    //    d   e (weight 100 between d-e)
    final a = TreeNode();
    final b = TreeNode();
    final c = TreeNode();
    final d = TreeNode();
    final e = TreeNode();

    a.addChild(b, 1);
    a.addChild(c, 1);
    c.addChild(d, 50);
    c.addChild(e, 100);

    expect(findMaxPathLengthInTreeHelper(a), equals(150)); // d->c->e
  });
}
