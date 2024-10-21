// src/components/MapComponent.js
import React, { useEffect } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

const MapComponent = ({ setProperty, latitude, longitude }) => {
    useEffect(() => {
        // Initialize the map
        const map = L.map('map').setView([latitude, longitude], 5); // Default to India view

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap'
        }).addTo(map);

        // Marker for selected location
        const marker = L.marker([latitude, longitude]).addTo(map);

        // Event listener for map clicks
        map.on('click', (e) => {
            const { lat, lng } = e.latlng; // Get latitude and longitude from click event
            marker.setLatLng([lat, lng]); // Move marker to clicked location
            setProperty((prev) => ({ ...prev, latitude: lat, longitude: lng })); // Update state
        });

        return () => {
            map.remove(); // Cleanup map on component unmount
        };
    }, [setProperty]);

    return <div id="map" style={{ height: '400px', width: '100%' }}></div>;
};

export default MapComponent;
