___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Tie",
  "brand": {
    "id": "Tie",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAMAAABrrFhUAAAAP1BMVEUeANf/+uuOfeHHu+aqnOPj2+lyXd9yXt86H9ksENjx6upWPtzVy+ecjeK5q+WAbeDVy+hkTt1WP9xILtudjeJLq7+kAAADRElEQVR42uzcyY6rMBBA0SoPgE3I1P3/3/oWbxF1JDsp4kQx3LOOEbkygxBGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHgpaJntAAAIQYCsBFl/0u4sAXos8AQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQIDtBTjsPYCuCjAPZdKVoRpg+6a47wDpoHsOkFzWfQVY4h+qurMAQf8gAAHqoltFHkg/48k94XJN7QN8gtRcndfnnZfrpgKkk1erOE6bCTBkXSO6bQSYvK4V5w0EOGV9ges+gNPXHFPfAYK+6px6DuD0deeOAzhtIXQb4KptnDoNkKK2kac+A/xqK77LAJO2M/cYIGg7vsMAk7Y09xdg0JaW/gIctKWcegswaVtzbwEu+kC8o3VLbwEWrYlDkjtpqDY49hbAa0VI5t2MvQU4aFmUglq13gJELZulYNaySVYy124TIGtRlIJytg4DaNnRPlW3FSB8fYDzUOR3EcBLUSAAAV4O4Mciv4sANQQgAAEIQAACEIAABCAAAQhAgK0GOLs10nYCBPkKBNCiuPcAOa0KMG8mgI6rArjtBIhpTYA8bSaAnqcVATROmwmgcUz2AJrd9FqAeSxK7QM8EP9YCgFKo9YFOH7HnWBlr4O+LkrRYRcBdJaCST8YILw3wKrl+f6TAdyqAM4WoL4x0+vl0tqwKsBJn3So5xnlXrpWh2RpbVoV4PL077XK/KKkl+bimgBJn3TStoI0t6hFMGabta1RmpttAYzZJGtTk7SXTQGM2WTRlg7yBs4UwJhNZm1plDdI2RLAmK3ti4hxkndwlgDGbG3XzCzyHtEQwJhN6lPgKyaA6UIQjAtCH2z9C84AtjtbDcZs5UumnZf3CYYApoOg9sWybzkATPsYjNmK36yz+xG79gWCcVGgFAt8zwngv3R8LoBxkDQqkEd5O2cP8HiQtCkQf+QD5mgPIEN90G2yLLqen+QjkrMHkCloxV3fr53+t3+TrQHqCQqzxSC7JJ+UBl8NUOgWawFuLiGrib8k+bg0u+MhGx9J/QzBx3KAm9vG63I8LpckAAAAAAAAAAAAAAAAAAAAAAAAwL/24EAAAAAAQJC/9SBXAAAAAIwEa75EOaWhoiYAAAAASUVORK5CYII\u003d"
  },
  "description": "Tracking Template to Enrich Marketing",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "Instructions",
    "displayName": "Thanks for installing the Tie tag in your Google Tag Manager container. Fire this tag on All Pages. The script listens for GA4-style ecommerce events in the dataLayer, including view_item, add_to_cart, and purchase. Enter your API key to activate the integration. Optionally, provide a variable containing the customer’s email address for improved matching accuracy. If available, you may also provide a variable containing the customer IP address."
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "apiKey",
    "simpleValueType": true,
    "help": "Please insert your Tie API key here:",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "email",
    "simpleValueType": true,
    "displayName": "Customer Email",
    "help": "Optional. Field to provide the customers email"
  },
  {
    "type": "TEXT",
    "name": "ip_address",
    "displayName": "IP Address",
    "simpleValueType": true,
    "help": "Optional. Advanced use only. Provide a variable containing the customer IP address if your site already exposes it."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');

(function() {
  var apiKey = data.apiKey;
  var email = data.email ? data.email.trim().toLowerCase() : '';
  var ipAddress = data.ip_address || '';

  if (!apiKey) {
    log('[Tie] No API key provided');
    data.gtmOnFailure();
    return;
  }

  setInWindow('tie_api_key', apiKey, true);

  if (email) {
    setInWindow('tie_email', email, true);
  }

  if (ipAddress) {
    setInWindow('tie_ip_address', ipAddress, true);
  }

  var scriptToLoad = 'https://tie-assets.web.app/v1.js';

  injectScript(scriptToLoad, function() {
    data.gtmOnSuccess();
  }, function() {
    data.gtmOnFailure();
  }, 'tie-v1');
})();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://tie-assets.web.app/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "tie_api_key"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "tie_email"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "tie_ip_address"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 23/03/2026, 13:29:53


