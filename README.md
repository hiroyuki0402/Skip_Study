# Skipに関しての学習などのブランチ

## Skipとは
SkipはSwiftとSwiftUIでiOSとAndroidの両方のネイティブアプリを開発できるツール
Swiftのコードを書けばiOSアプリだけでなく、Androidアプリも作れる
内部的にはSwift/SwiftUIのコードをKotlinにトランスパイルしてAndroid用のAPKを作る

### 特徴
- **ネイティブUIを維持**
  - iOSはSwiftUI、AndroidはJetpack Composeで表示
  - iOSとAndroidそれぞれのプラットフォームに最適なUIを作れる
- **Swiftの知識だけでOK**
  - Android開発のためにKotlinを勉強しなくても、Swiftのコードだけで両OSのアプリが作れる
- **企業向けにも使いやすい**
  - 1つのコードベースでiOSとAndroidのアプリを同時に開発できる
  - iOSエンジニアしかいなくても、Androidアプリを提供できる

## FlutterやKMPとの違い
### Flutterとの違い
- FlutterはDartを使うけど、SkipはSwiftをそのまま使える
- Flutterは独自UI（Widget）で動くけど、SkipはネイティブUIをそのまま利用する

### KMP（Kotlin Multiplatform）との違い
- KMPはKotlinベースで、iOSアプリ向けにSwiftに変換するけど、Skipは逆にSwiftをKotlinに変換する
- SkipはiOS開発者向け、KMPはAndroid開発者向けのツールというイメージ

## 価格プラン
- **Indie（無料）プラン**
  - オープンソースアプリは無制限に作れる
  - クローズドソースのアプリは1つだけ作れる
- **有料プラン**
  - Small Business, Professional などのプランがある
  - チームでの開発や複数のクローズドソースアプリを作る場合に必要

## 使いどころ
- 個人開発でiOSとAndroidを同時に開発したいとき
- 社内向けアプリでコストを抑えつつ両OSに対応したいとき
- iOSエンジニアがAndroidアプリを作る必要があるとき

## 公式リソース
- [公式サイト](https://skip.tools)
- [ドキュメント](https://skip.tools/docs)
- [GitHub](https://github.com/skiptools)