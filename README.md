# coding-challenge
study with coding challenge (https://www.youtube.com/user/shiffman/)


## How to export GIF

### Step 1: Processingで画像をフォルダに保存する

```java
int totalFrames = 60; // 保存するフレーム数
int frameCount = 0;
String folderName = "frames"; // フォルダ名

void setup() {
  size(400, 400);
  
  // フォルダを作成
  new File(folderName).mkdir();
}

void draw() {
  background(255);
  
  // 描画内容
  fill(0);
  ellipse(frameCount * 5 % width, height / 2, 50, 50); // 円を動かす
  
  // フレームをフォルダに保存
  String filename = folderName + "/frame" + nf(frameCount, 3) + ".png"; // フレーム名
  saveFrame(filename);
  
  frameCount++;
  
  if (frameCount >= totalFrames) {
    noLoop(); // draw()のループを停止
  }
}
```


### Step 2: FFmpegでGIFに変換する


```bash
cd path/to/your/frames
ffmpeg -framerate 20 -i frame%03d.png -vf "scale=400:-1:flags=lanczos,fps=10" ../output.gif
```

- -framerate 20: GIFのフレームレートを設定（例: 20fps）。
- -i frame%03d.png: 入力ファイルの指定。
- -vf "scale=400:-1:flags=lanczos,fps=10": 画像サイズを400ピクセル幅にスケールし、高さはアスペクト比を維持して自動計算。fps=10でGIFのフレームレートを設定。
- ../output.gif: 出力ファイル名を指定。

