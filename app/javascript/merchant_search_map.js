let map;
let markers = [];
let infoWindows = [];
let activeInfoIndex = null;

// No Image のフォールバック処理
function fallbackImage(url) {
  return (url && url.length > 0)
    ? url
    : "https://placehold.jp/cccccc/999999/80x80.png?text=No%20Image";
}

// InfoWindow HTML
function buildInfoContent(merchant, index) {
  return `
    <div class="relative w-40 h-25 p-3 mt-1">
      <button
        class="absolute top-1 right-1 text-gray-500 hover:text-gray-700 text-xl font-bold close-btn"
        data-index="${index}"
        style="background: none; border: none; cursor: pointer;">
        ×
      </button>

      <div class="mb-2 mt-6 font-semibold text-[18px]">
        ${merchant.name}
      </div>

      <button
        class="text-blue-500 detail-btn"
        data-index="${index}"
        data-name="${merchant.name}"
        data-address="${merchant.address}"
        data-description="${merchant.description || "説明文が登録されていません。"}"
        data-image-url="${merchant.image_url || ''}"
        popovertarget="merchant-detail"
      >
        詳細を見る
      </button>
    </div>
  `;
}

// 詳細ポップアップ更新
function updateDetailPopup(btn) {
  document.getElementById("merchant-name").innerText = btn.dataset.name;
  document.getElementById("merchant-address").innerText = btn.dataset.address;
  document.getElementById("merchant-description").innerText = btn.dataset.description;

  const img = document.querySelector("#merchant-detail img");
  if (img) img.src = fallbackImage(btn.dataset.imageUrl);
}

// マーカークリックイベント
function attachMarkerEvent(index) {
  markers[index].addListener("click", () => {

    if (activeInfoIndex !== null) {
      infoWindows[activeInfoIndex].close();
    }

    infoWindows[index].open({
      anchor: markers[index],
      map
    });
    activeInfoIndex = index;

    google.maps.event.addListenerOnce(infoWindows[index], "domready", () => {
      const closeBtn = document.querySelector(`.close-btn[data-index="${index}"]`);
      if (closeBtn) {
        closeBtn.addEventListener("click", () => infoWindows[index].close());
      }

      const detailBtn = document.querySelector(`.detail-btn[data-index="${index}"]`);
      if (detailBtn) {
        detailBtn.addEventListener("click", () => updateDetailPopup(detailBtn));
      }
    });
  });
}

// マーカー生成
function setMarkers(data) {
  data.forEach((merchant, index) => {
    const position = {
      lat: parseFloat(merchant.latitude),
      lng: parseFloat(merchant.longitude)
    };

    markers[index] = new google.maps.Marker({
      position,
      map,
      title: merchant.name,
      icon: { url: "/img/map_logo.png" }
    });

    infoWindows[index] = new google.maps.InfoWindow({
      content: buildInfoContent(merchant, index)
    });

    attachMarkerEvent(index);
  });
}

// 地図初期化
function initMap() {
  if (!window.merchantsData) return;

  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 35.3311886, lng: 132.6268218 },
    zoom: 8.5
  });

  if (Array.isArray(window.merchantsData)) {
    setMarkers(window.merchantsData);
  }
}

// Google Maps API callback
window.initMap = initMap;

// Turbo 対応
document.addEventListener("turbo:load", () => {
  if (window.google?.maps) initMap();
});