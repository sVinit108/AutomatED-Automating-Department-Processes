const mongoose = require('mongoose');
const db = require('../config/db');

const actSchema = new mongoose.Schema(
    {
        sr_no: {
            type: Number,
            required: true,
            unique: true,
        },
        branch_div: {
            type: String,
            required: true,
        },
        uid: {
            type: String,
            required: true,
            unique: true,
        },
        roll_no: {
            type: Number,
            required: true,
        },
        student_name: {
            type: String,
            required: true,
        },
        mobile_no: {
            type: Number,
            required: true,
        },
        email_id: {
            type: String,
            required: true,
        },
        act_attendance: {
            type: Number,
            required: true,
        },
        act_test_marks: {
            type: Number,
            required: true,
        },
        cdt_attendance: {
            type: Number,
            required: true,
        },
        cdt_test_marks: {
            type: Number,
            required: true,
        },
        sdp_attendance: {
            type: Number,
            required: true,
        },
        train_batch: {
            type: Number,
            required: true,
        },
        domain: {
            type: String,
            required: true,
        },
        category: {
            type: Number,
            required: true,
        },
        placed_comp: {
            type: String,
            required: true,
        },
        package_lpa: {
            type: Number,
            required: true,
        },
        role: {
            type: String,
            required: true,
        },
    }
);


const actModel = db.model('act', actSchema);

module.exports = actModel;