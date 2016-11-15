
   $(document).ready(function() {
    $('#companyDetailForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            d_Organization: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please supply your Organization Name'
                    }
                }
            },
            d_PersonCompletingSurvey: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Supply Person Completing Survey Name'
                    }
                }
            },
            d_PersonCompletingSurvey_Title: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Supply Person Completing Survey Title'
                    }
                }
            },
            d_PersonCompletingSurvey_Email: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your email address'
                    },
                    emailAddress: {
                        message: 'Please supply a valid email address'
                    }
                }
            },
            d_PersonCompletingSurvey_Phone: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your phone number'
                    },
                    phone: {
                        country: 'US',
                        message: 'Please supply a vaild phone number with area code'
                    }
                }
            },
            d_City: {
                validators: {
                     stringLength: {
                        min: 4,
                    },
                    notEmpty: {
                        message: 'Please supply your city'
                    }
                }
            },
            d_State: {
                validators: {
                    notEmpty: {
                        message: 'Please select your state'
                    }
                }
            },
            d_ZipCode: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your zip code'
                    },
                    zipCode: {
                        country: 'US',
                        message: 'Please supply a vaild zip code'
                    }
                }
            },
            d_LargestLocCity: {
                validators: {
                     stringLength: {
                        min: 4,
                    },
                    notEmpty: {
                        message: 'Please supply your city'
                    }
                }
            },
            d_LargestLocState: {
                validators: {
                    notEmpty: {
                        message: 'Please select your state'
                    }
                }
            },
            d_LargestLocZipCode: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your zip code'
                    },
                    zipCode: {
                        country: 'US',
                        message: 'Please supply a vaild zip code'
                    }
                }
            },
            d_NAICSMaster: {
                validators: {
                     stringLength: {
                        min: 6,
                        max: 6,
                        message:'Please enter the 6 digit NAICS code'
                    },
                    notEmpty: {
                        message: 'Please supply your city'
                    }
                }
            },
            d_OrgType: {
                validators: {
                    notEmpty: {
                        message: 'Please select your state'
                    }
                }
            },
          }
        })


        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#companyDetailForm').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
