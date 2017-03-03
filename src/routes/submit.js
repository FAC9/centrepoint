const addFormData = require('../helpers/add-form-data');

module.exports = [{
  method: 'POST',
  path:'/submit',
  handler: (req, reply) => {
    addFormData(req.payload, (err) => {
      if(err) {
        console.log("Form data error: ", err);
      }
      return reply.view('thankyou');
    })
  }
}];
