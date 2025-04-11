const router = require('express').Router();
const actController = require('../controller/act_controller');

// router.post('/insertActData', async (req, res, next) => {
//     actController.insertActData(req, res, next);
// });

router.post('/postData', actController.insertACTData);

router.get('/getData', actController.getACTData);

router.delete('/deleteData', actController.deleteACTDataById);

router.put('/putData', actController.putACTData);

router.put('/putDataById', actController.putACTDataById);

module.exports = router;