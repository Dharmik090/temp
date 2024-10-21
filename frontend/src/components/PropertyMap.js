import React from 'react';
import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import 'leaflet/dist/leaflet.css'; // Import Leaflet CSS
import L from 'leaflet';

// Fix for marker icon issue (if needed)
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
    iconUrl: require('leaflet/dist/images/marker-icon.png'),
    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

const PropertyMap = ({ latitude, longitude }) => {
    // Ensure latitude and longitude are numbers
    const lat = parseFloat(latitude);
    const lng = parseFloat(longitude);

    // Log the coordinates for debugging
    console.log('Latitude:', lat, 'Longitude:', lng);

    return (
        <MapContainer center={[lat, lng]} zoom={13} style={{ height: "400px", width: "100%" }}>
            <TileLayer
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            />
            <Marker position={[lat, lng]}>
                <Popup>
                    You are here!
                </Popup>
            </Marker>
        </MapContainer>
    );
};

export default PropertyMap;
