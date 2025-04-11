const actModel = require('../model/act_model');


class ACTServices {
    static async postACTData(sr_no,
        branch_div,
        uid,
        roll_no,
        student_name,
        mobile_no,
        email_id,
        act_attendance,
        act_test_marks,
        cdt_attendance,
        cdt_test_marks,
        sdp_attendance,
        train_batch,
        domain,
        category,
        placed_comp,
        package_lpa,
        role) {
        try {
            const act = new actModel({
                sr_no: sr_no,
                branch_div: branch_div,
                uid: uid,
                roll_no: roll_no,
                student_name: student_name,
                mobile_no: mobile_no,
                email_id: email_id,
                act_attendance: act_attendance,
                act_test_marks: act_test_marks,
                cdt_attendance: cdt_attendance,
                cdt_test_marks: cdt_test_marks,
                sdp_attendance: sdp_attendance,
                train_batch: train_batch,
                domain: domain,
                category: category,
                placed_comp: placed_comp,
                package_lpa: package_lpa,
                role: role
            });
            // console.log("//////////////////////////////////////")

            await act.save();
            // console.log("//////////////////////////////////////")
            // console.log(act);
            return act;
        } catch (error) {
            return error;
        }
    }

    static async getACTData(filterCriteria) {
        try {
            const actData = await actModel.find(filterCriteria).sort({ srNo: 1 });
            return actData;
        } catch (error) {
            return error;
        }
    }

    // delete data by uid
    static async deleteACTDataById(uid) {
        console.log(uid);
        try {
            const actData = await actModel.findOneAndDelete({ uid: uid });
            return actData;
        }
        catch (error) {
            return error;
        }
    }

    // put data by UID
    static async putACTData(sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role) {
        try {
            const actData = await actModel.findOneAndUpdate(
                { uid: uid },
                {
                    sr_no: sr_no,
                    branch_div: branch_div,
                    uid: uid,
                    roll_no: roll_no,
                    student_name: student_name,
                    mobile_no: mobile_no,
                    email_id: email_id,
                    act_attendance: act_attendance,
                    act_test_marks: act_test_marks,
                    cdt_attendance: cdt_attendance,
                    cdt_test_marks: cdt_test_marks,
                    sdp_attendance: sdp_attendance,
                    train_batch: train_batch,
                    domain: domain,
                    category: category,
                    placed_comp: placed_comp,
                    package_lpa: package_lpa,
                    role: role
                }
            );
            return actData.save();
        }
        catch (error) {
            return error;
        }
    }

    // put data by id

    static async putACTDataById(id, sr_no, branch_div, uid, roll_no, student_name, mobile_no, email_id, act_attendance, act_test_marks, cdt_attendance, cdt_test_marks, sdp_attendance, train_batch, domain, category, placed_comp, package_lpa, role) {
        try {
            const actData = await actModel.findByIdAndUpdate(
                { _id: id },
                {
                    sr_no: sr_no,
                    branch_div: branch_div,
                    uid: uid,
                    roll_no: roll_no,
                    student_name: student_name,
                    mobile_no: mobile_no,
                    email_id: email_id,
                    act_attendance: act_attendance,
                    act_test_marks: act_test_marks,
                    cdt_attendance: cdt_attendance,
                    cdt_test_marks: cdt_test_marks,
                    sdp_attendance: sdp_attendance,
                    train_batch: train_batch,
                    domain: domain,
                    category: category,
                    placed_comp: placed_comp,
                    package_lpa: package_lpa,
                    role: role
                }
            );
            return actData.save();
        }
        catch (error) {
            return error;
        }
    }
}

module.exports = ACTServices;