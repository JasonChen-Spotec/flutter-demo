/// 数组工具
class ArrayUtil {
  static bool isEmpty(List array) {
    return (array.length <= 0);
  }

  static bool isNotEmpty(List array) {
    // not use array.isNotEmpty to
    return (array.length > 0);
  }
}
