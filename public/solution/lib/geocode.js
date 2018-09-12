import GMaps from 'gmaps';

function injectCoordinates(coordinates) {
  const paragraphElement = document.getElementById('coordinates');
  paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
}

function injectMap(coordinates) {
  const lat = coordinates.lat;
  const lng = coordinates.lng;

  const map = new GMaps({ el: '#map', lat: lat, lng: lng, zoom: 14 });
  const marker = { lat: lat, lng: lng };
  map.addMarkers([ marker ]);
}

export { injectCoordinates, injectMap };
