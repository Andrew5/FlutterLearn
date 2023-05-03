// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api, no_logic_in_create_state

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

void main() => runApp(const MyApp());

/*
ElevatedButton：凸起的按钮，一般用于重要的操作，比如提交表单等。
TextButton：文字按钮，一般用于次要的操作，比如取消、返回等。
OutlinedButton：带边框的按钮，一般用于一些不太重要的操作。
IconButton：图标按钮，一般用于带有图标的操作，比如分享、点赞等。
FloatingActionButton：悬浮按钮，一般用于主要的操作，比如新增、编辑等。
DropdownButton：下拉框按钮，一般用于选择列表中的一项。
CupertinoButton：类似于iOS风格的按钮，一般用于iOS应用的开发。
RawMaterialButton：原材料按钮，可以自定义样式，比较灵活。
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Button Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: DHHomeButton(),
        ));
    // home: DHHomeButton(),
  }
}

class DHHomeButton extends StatefulWidget {
  const DHHomeButton({super.key});

  @override
  State<DHHomeButton> createState() => _DHHomeButtonState();
}

class _DHHomeButtonState extends State<DHHomeButton> {
  set isLoading(bool isLoading) {}

  String icons = "";

  late bool _isRefreshing = false;
  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isRefreshing = false;
    });
  }
//如果你将这些代码放在build方法中，那么每次Widget重新build时都会重新执行build方法，也就是重新生成Text Widget，包括其中的icons和TextStyle等。这样可能会导致性能问题，尤其是icons等变量内容较多或者TextStyle等属性改动频繁的情况下。

// 为了避免这种性能问题，你可以将icons和TextStyle等变量设置为StatefulWidget的成员变量，然后在build方法外部进行初始化，而不是在build方法内部进行初始化，这样在执行build方法时就不会重新创建这些变量。另外，你也可以将这些变量设置为常量或者静态变量，这样也可以避免每次build时重新创建这些变量的问题。

// 定义和初始化放在initState方法中，避免每次build时都执行赋值操作，导致重复添加字符串

  @override
  void initState() {
    super.initState();
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += "\uE237";
    // fingerprint: 0xe287
    icons += "\uE287";
  }

  @override
  Widget build(BuildContext context) {
    // 当 Flutter 内容超出屏幕时，可以使用滚动控件来解决，例如 SingleChildScrollView、ListView、GridView 等。这些控件可以自动适应内容大小，并且可以滚动查看整个内容。
    // 在 Scaffold 的 resizeToAvoidBottomInset 属性中设置为 false，这将防止底部被键盘遮挡。
    // 如果你的内容高度已知，可以在 Scaffold 中添加一个底部留白，让内容下移。例如，在 body 属性中嵌套一个 Padding 控件，将底部留出一定的空间。
    // 如果你的内容高度不确定，可以使用 MediaQuery 来获取屏幕高度，然后根据屏幕高度和内容高度来计算底部留白的高度。
    /*
    Scaffold(
      resizeToAvoidBottomInset: false, // 禁止底部被键盘遮挡
      body: SingleChildScrollView(
      child: Column(
      children: [
        // 其他内容
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomNavigationBar(
        // 底部导航栏内容
        ),
      ),
    );
    */

    return SingleChildScrollView(
        child: Column(
      // row默认是占据整行且居中
      // crossAxisAlignment: CrossAxisAlignment.start,
      // 组头上的大小
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _textButton(),
        MyButton(
          onPressed: () {},
        ),
        MyPage(),
        CustomElevatedButton(
          text: '登录',
          backgroundColor: Color(0xffFCB605),
          onPressed: () {},
        ),
        CustomOutlinedButton(
          onPressed: () {},
          margin: EdgeInsets.only(right: 20, left: 20, top: 10),
          borderRadius: 25,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text('OutlinedButton'),
        ),
        CustomIconButton(
          icon: Icons.search,
          label: 'Search',
          onPressed: () {
            // Do something when the button is pressed
          },
        ),
        _CustomIconButton(
            icon: Icons.favorite,
            text: "Search",
            onPressed: () => print("_CustomIconButton!"),
            iconColor: Colors.red,
            textColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        CustomDropdownButton(
          elevation: 4, // 设置阴影
          padding: EdgeInsets.all(8.0), // 设置 padding
          items: const [
            // 下拉列表项
            DropdownMenuItem<String>(
              value: 'option1',
              child: Text('Option 1'),
            ),
            DropdownMenuItem<String>(
              value: 'option2',
              child: Text('Option 2'),
            ),
            DropdownMenuItem<String>(
              value: 'option3',
              child: Text('Option 3'),
            ),
          ],
          onChanged: (value) {
            // 当下拉列表项被选中时回调
            print('Selected: $value');
          },
        ),
        CustomCupertinoButton(
          onPressed: () {},
          minSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Text('Cupertino Button'),
        ),
        CustomRawMaterialButton(
          isLoading: _isRefreshing,
          onPressed: () {
            _handleRefresh();
            print('CustomRawMaterialButton$_isRefreshing');
          },
          text: 'RawMaterialButton',
        ),
        FadeInImage(
          //淡入淡出动画
          placeholder: AssetImage("images/DSC_10611.jpeg"),
          image: NetworkImage(
              "https://book.flutterchina.club/assets/img/3-10.6e8d650a.png"),
          // width: 100.0,
          // height: 100.0,
          fadeOutDuration: Duration(milliseconds: 1),
          fadeInDuration: Duration(milliseconds: 1),
        ),
        ButtonTheme(
          minWidth: 50,
          height: 50,
          child: IconButton(
            color: Colors.red,
            padding: EdgeInsets.all(10),
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              print('Selected:2');
            },
          ),
        ),
        Text(
          icons,
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 24.0,
            color: Colors.green,
          ),
        ),
      ],
    ));
  }

  Widget _elevatedButton() {
    return Column(
      children: <Widget>[
        ElevatedButton(
          // style: ButtonStyle(
          //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
          //     elevation: MaterialStateProperty.all(0),
          //     backgroundColor: MaterialStateProperty.all(Color(0xffFCB605)),
          //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(35)))),
          onPressed: () {},
          onLongPress: () {
            // ignore: avoid_print
            print('我被长按了');
          },
          /*
          想要实现的效果是按钮据屏幕左右边距各有40px,根据不同的屏幕宽度自己适应，
          所以我在外边放了一个Container,设置了左右margin,
          然后再里边放ElevateButton,
          但是ElevateButton的宽度却不能撑满Container，就想在ElevateButton外边嵌套一个SizeBox,SizeBox设置宽度的话，ElevateButton能够盛满SizeBox，
          但是我想让SizeBox的宽度撑满Container，SizeBox的宽度就不能设置固定，
          然后发现网上宽度可以设置为double.infinity 无穷大，
          但是不会超出Container的宽度。
          */
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 0),
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 20,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xffFCB605)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35))),
                ),
                onPressed: () {},
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _textButton() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 20),
            padding: EdgeInsets.only(right: 20, left: 20),
          ),
          onPressed: () {},
          child: Text(
            "Click Me!",
            style: TextStyle(
              fontSize: 22,
              color: Colors.amber,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Gradient'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CustomIconButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    Color? iconColor,
    Color? textColor,
  }) {
    return Padding(
      padding: padding,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({Key? key, required this.onPressed}) : super(key: key);

  static const double padding = 20.0;
  static const double borderRadius = 35.0;
  static const Color backgroundColor = Color(0xffFCB605);
  static const TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          '登录',
          style: textStyle,
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          onLongPress: () {},
          child: MyButton(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

// 封装
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double borderRadius;
  final Function onPressed;

  const CustomElevatedButton({
    required this.text,
    required this.backgroundColor,
    this.borderRadius = 35.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 10),
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: onPressed as void Function()?,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Widget child;
  final ShapeBorder? shape;
  final BorderSide? borderSide;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 20,
    this.width,
    this.style,
    this.height,
    this.padding,
    this.borderSide,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: style ?? OutlinedButton.styleFrom(),
        // style: ButtonStyle(
        //   padding: MaterialStateProperty.all(padding),
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(borderRadius),
        //     ),
        //   ),
        //   side: MaterialStateProperty.all(borderSide ?? BorderSide.none),
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: child,
          // child: Text(
          //   text,
          //   style: TextStyle(fontSize: 16),
          // ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  final bool iconOnLeft;

  const CustomIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconOnLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconOnLeft) Icon(icon, color: Colors.black),
          SizedBox(width: 8),
          Text(label),
          SizedBox(width: 8),
          if (!iconOnLeft) Icon(icon, color: Colors.black),
        ],
      ),
    );
  }
}

class CustomDropdownButton<T> extends StatefulWidget {
  // 定义属性
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final EdgeInsetsGeometry? padding; // 命名参数的类型
  final Color? dropdownColor;
  final double? elevation;
  final TextStyle? style;
  final Widget? hint;
  final Widget? icon;

  const CustomDropdownButton({
    Key? key, // 添加命名参数
    required this.items,
    this.value,
    this.onChanged,
    this.padding,
    this.dropdownColor,
    this.elevation,
    this.style,
    this.hint,
    this.icon,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState<T> createState() =>
      _CustomDropdownButtonState<T>(padding: padding);
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  T? _value;

  late final EdgeInsetsGeometry? padding;
  _CustomDropdownButtonState({
    required this.padding,
  });

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    // padding ??= widget.padding;// 会导致属性被重写
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets resolvedPadding =
        widget.padding?.resolve(Directionality.of(context)) ?? EdgeInsets.zero;
    return DropdownButton<T>(
      value: _value,
      onChanged: (T? value) {
        setState(() {
          _value = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      items: widget.items,
      icon: widget.icon,
      hint: widget.hint,
      style: widget.style,
      elevation: widget.elevation!.toInt(),
      dropdownColor: widget.dropdownColor,
    );
  }
}

class CustomCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? minSize;
  // final double? padding;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadius? borderRadius;

  const CustomCupertinoButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.minSize,
    this.padding,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      minSize: minSize ?? 44,
      padding: padding ?? EdgeInsets.zero,
      color: color ?? Theme.of(context).primaryColor,
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(8)),
      child: child,
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const CustomCircularProgressIndicator({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: size * 0.1,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}

class CustomRawMaterialButton extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  const CustomRawMaterialButton({
    Key? key,
    this.padding,
    this.alignment = Alignment.center,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomRawMaterialButtonState createState() =>
      _CustomRawMaterialButtonState();
}

class _CustomRawMaterialButtonState extends State<CustomRawMaterialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.isLoading
        ? CustomCircularProgressIndicator(
            size: 20.0,
            color: Colors.white,
          )
        : Text(widget.text, style: const TextStyle(color: Colors.white));

    return RawMaterialButton(
      padding: widget.padding ?? EdgeInsets.all(8),
      // materialTapTargetSize: MaterialTapTargetSize.padded,
      fillColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: widget.isLoading ? null : widget.onPressed,
      child: Stack(
        alignment: widget.alignment,
        children: [
          child,
          if (widget.isLoading)
            Transform.rotate(
              angle: _animation.value * 2.0 * math.pi,
              // child: const Icon(
              //   Icons.refresh,
              //   color: Color.fromARGB(255, 150, 66, 66),
              // ),
            ),
        ],
      ),
    );
  }
}
