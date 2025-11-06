import QrScanner from "https://cdn.jsdelivr.net/npm/qr-scanner@1.4.2/qr-scanner.min.js";

document.addEventListener("turbo:load", async () => {
  const video = document.getElementById('qr-video');
  if (!video) return;

  const qrScanner = new QrScanner(
    video,
    result => {
      qrScanner.stop();

      const data = typeof result === "string" ? result : result.data;

      try {
        const url = new URL(data);

        if (url.origin === window.location.origin || url.hostname === window.location.hostname) {
          window.location.href = data;
        } else {
          if (confirm("外部サイトがスキャンされました。\n" + data + " に移動しますか？")) {
            window.location.href = data;
          } else {
            location.reload();
          }
        }
      } catch (err) {
        alert("無効なQRコードです");
        location.reload();
      }
    },
    {
      calculateScanRegion: video => {
        const width = video.videoWidth;
        const height = video.videoHeight;

        const regionWidth = Math.min(width * 0.5, 400);
        const regionHeight = Math.min(height * 0.5, 400);
        const x = Math.floor((width - regionWidth) / 2);
        const y = Math.floor((height - regionHeight) / 2);

        const downScaledWidth = 400;
        const downScaledHeight = Math.floor(downScaledWidth * (regionHeight / regionWidth));

        return {
          x, y,
          width: Math.floor(regionWidth),
          height: Math.floor(regionHeight),
          downScaledWidth,
          downScaledHeight
        };
      },
      highlightScanRegion: true,
      returnDetailedScanResult: true
    }
  );

  try {
    const hasCamera = await QrScanner.hasCamera();
    if (!hasCamera) throw new Error("No camera found");

    await qrScanner.start();
  } catch (e) {
    alert("お使いの環境ではQRコードスキャンが利用できません。協賛店IDまたはミッションIDを手動で入力してください。");

    // 手動入力のポップオーバーを表示
    const popover = document.getElementById("open-manual-input");
    popover.showPopover();

    console.error(e);
  }
});