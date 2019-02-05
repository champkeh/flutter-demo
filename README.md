# flutter_demo

学习 Flutter 框架的一些示例

## 贝塞尔曲线裁剪图片

### 效果：
<div>
<img src="/assets/images/wave-effect-on-ios.png" height="500" />
<img src="/assets/images/wave-effect-on-android.png" height="500" />
</div>

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
            <img src="/assets/screenshots/text-ios.png" width='400' />
        </td>
    </tr>
</table>
