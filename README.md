# flutter_demo

学习 Flutter 框架的一些示例

## 贝塞尔曲线裁剪图片

<table>
    <tr>
        <td>
            <pre>
                class BottomWaveClipper extends CustomClipper<Path> {
                    @override
                    Path getClip(Size size) {
                        var path = Path();
                        path.lineTo(0, size.height - 60);
                        var firstControlPoint = Offset(size.width / 4, size.height - 55);
                        var firstEndPoint = Offset(size.width / 2.25, size.height - 80);
                        path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
                            firstEndPoint.dx, firstEndPoint.dy);
                        var secondControlPoint =
                            Offset(size.width - (size.width / 3.25), size.height - 105);
                        var secondEndPoint = Offset(size.width, size.height - 90);
                        path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
                            secondEndPoint.dx, secondEndPoint.dy);
                        path.lineTo(size.width, 0);
                        path.close();
                        return path;
                    }
                    @override
                    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
                }
            </pre>
        </td>
        <td>
            <img src="/assets/screenshots/wavy-image.png" width=400 />
        </td>
    </tr>
</table>

使用到的组件和类:
- ClipPath
- CustomClipper<Path>
- Path


## Text

<table>
    <tr>
        <td>
            <pre>
            Text(
                 'Hello Flutter It is Awesome WOW',
                 textAlign: TextAlign.right,
                 textDirection: TextDirection.ltr,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
                 style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 2,
                      wordSpacing: 40,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.wavy,
                 ),
            )
            </pre>
        </td>
        <td>
            <img src="/assets/screenshots/text-ios.png" width=400 />
        </td>
    </tr>
</table>
