const actModel = require('../model/act_model');
const ACTServices = require('../services/act_services');

exports.insertACTData = async (req, res, next) => {
    try {
        const { sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role } = req.body;

        // console.log(req.body);

        const successRes = await ACTServices.postACTData(sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role);

        res.json({ success: successRes, message: "Data inserted successfully" });
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
};

exports.getACTData = async (req, res, next) => {
    try {

        // console.log(req.query);

        const successRes = await ACTServices.getACTData(req.query);

        res.json(successRes);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

exports.deleteACTDataById = async (req, res, next) => {
    try {
        const { uid } = req.body;

        const successRes = await ACTServices.deleteACTDataById(uid);

        res.json({ success: successRes, message: "Data deleted successfully" });
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}


exports.putACTData = async (req, res, next) => {
    try {
        const { sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role } = req.body;

        const successRes = await ACTServices.putACTData(sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role);

        res.json({ success: successRes, message: "Data updated successfully" });
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}


exports.putACTDataById = async (req, res, next) => {
    try {
        const { id, sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role } = req.body;

        const successRes = await ACTServices.putACTDataById(id, sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role);

        res.json({ success: successRes, message: "Data updated successfully" });
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}