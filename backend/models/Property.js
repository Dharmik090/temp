const mongoose = require('mongoose');
const User = require('./User');

const propertySchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    bhk: {
        type: Number,
        required: true
    },
    area: {
        type: Number,
        required: true
    },
    status: {
        type: String,
        required: true
    },
    location: {
        type: String,
        required: true
    },
    city: {
        type: String,
        required: true
    },
    state: {
        type: String,
        required: true
    },
    country: {
        type: String,
        required: true
    },
    latitude: {
        type: Number,
        required: false
    },
    longitude: {
        type: Number,
        required: false
    },
    images: {
        type: [Buffer],
        required: true,
    },
    userid: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    createdate: {
        type: Date,
        default: Date.now
    }
});


module.exports = mongoose.model('Property',propertySchema);