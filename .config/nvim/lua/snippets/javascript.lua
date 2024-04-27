local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    "crud-evc-std", fmt(
      [[
const {{ validationResult }} = require('express-validator');
const {} = require('../models/{}');

// C--- (Create)
exports.cCreate = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure({{ errors: validationResult.array() }},400, -3);
  }} else {{
    const errors = [];
    const code = -1;
    try {{
      if (req.body.bulk) {{
        const rawResult = await {}.insertMany(
          req.body.bulkData,
          {{ rawResult: true }}
        );
        if (req.body.bulk.length === rawResult.insertedIds) {{
          return res.success(rawResult.insertedIds, 200);
        }} else {{
          const errorMsg = "Data length differs from original source of insertion";
          errors.push(
            {{
              msg: errorMsg
            }}
          );
          throw new Error(errorMsg);
        }}
      }} else {{
        const newDoc = await {}.create({{ /* Parameters */ }});
        if (!newDoc) {{
          const errorMsg = "The document, was not created properly";
          code = -2;
          errors.push(
            {{
              msg: errorMsg
            }}
          );
          throw new Error(errorMsg);
        }} else {{
          return res.success(newDoc, 200);
        }}
      }}
    }} catch (err) {{
      console.error(err);
      if (errors.findIndex((error) => error.msg === err.message) !== -1) {{
        errors.push({{ msg: err }});
      }}
      return res.failure(errors, 500, code);
    }}
  }}
}}

// -R-- (Read)
exports.cRead = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure({{ errors: validationResult.array() }},400, -3);
  }} else {{
    const errors = [];
    let code = -1;
    let filter = {{
      ...(req.query.deleted === 'true' ? {{ deleted: true }} : {{ deleted: false }}),
      /* More filters here */
    }};
    try {{
      if (req.query.many) {{
        const documents = await {}.find(filter);
        return res.success(documents, 200);
      }} else {{
        filter = {{
          ...filter,
          _id: req.query.id,
          /* More filters here */
        }};
        const document = await {}.findOne(filter);
        return res.success(document, 200);
      }}
    }} catch (err) {{
      console.error(err);
      if (errors.findIndex((error) => error.msg === err.message) !== -1) {{
        errors.push({{ msg: err }});
      }}
      return res.failure(errors, 500, code);
    }}
  }}
}}

// --U- (Update)
exports.cUpdate = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure({{ errors: validationResult.array() }},400, -3);

  }} else {{
    const errors = [];
    const code = -1;
    let filter = {{
      ...(req.body.deleted.filter === 'true' ? {{ deleted: true }} : {{}})
    }};

    try {{
      if (req.body.all) {{
        const update = {{
        }}
        const updateResult = await {}.updateMany(
          {{}},
          update,
        );
        if (!updateResult.acknowledged) {{
          const errorMsg = "The document(s), were not updated properly";
          code = -2;
          errors.push(
            {{
              msg: errorMsg
            }}
          );
          throw new Error(errorMsg);
        }} else {{
          return res.success(updateResult, 200);
        }}
      }} else {{
        filter = {{
          ...filter,
        }};
        const update = {{
          /* Your update */
        }};
        const updateResult = await {}.findOneAndUpdate(filter, update, {{new: true}});
        if (!updateResult) {{
        const errorMsg = "The document was not updated properly";
          code = -2;
          errors.push(
            {{
              msg: errorMsg
            }}
          );
          throw new Error(errorMsg);
        }} else {{
          return res.success(updateResult, 200);
        }}
       }}
    }} catch (err) {{
      console.error(err);
      if (errors.findIndex((error) => error.msg === err.message) !== -1) {{
        errors.push({{ msg: err }});
      }}
      return res.failure(errors, 500, code);
    }}
  }}
}}

// ---D (Delete)
exports.cDelete = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure({{ errors: validationResult.array() }},400, -3);
  }} else {{
    const errors = [];
    const code = -1;
    const FILTER = {{ _id: req.query.id }};
    let deletionStatus = null;
    try {{
      if (req.query.hard) {{
        deletionStatus = await {}.findOneAndDelete(FILTER);
      }} else {{
        deletionStatus = await {}.findOneAndUpdate({{ ...FILTER, deleted: false }})
      }}
      if (!deletionStatus) {{
        const errorMsg = 'Operation failed';
        code = -2;
        errors.push(
          {{
            msg: errorMsg
          }}
        );
        throw new Error(errorMsg);
      }}
    }} catch(err) {{
      console.error(err);
      if (errors.findIndex((error) => error.msg === err.message) !== -1) {{
        errors.push({{ msg: err }});
      }}
      return res.failure(errors, 500, code)
    }}
  }}
}}
		]],
    {
      i(1, ""),
      r(1),
      r(1), r(1), r(1), r(1),
      r(1), r(1), r(1), r(1),
    })
  ),
  s(
    "crud-evc-work", fmt(
      [[
const {{ validationResult }} = require('express-validator');
const {} = require('../models/{}');

// C--- (Create)
exports.cCreate = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure(-3, {{ errors: validationResult.array() }}, 400);
  }} else {{
    const error = null;
    const code = -1;
    try {{
      if (req.body.bulk) {{
        const rawResult = await {}.insertMany(
          req.body.bulkData,
          {{ rawResult: true }}
        );
        if (req.body.bulk.length === rawResult.insertedIds) {{
          return res.success(rawResult.insertedIds, 200);
        }} else {{
          error = "El numero de documentos insertados difiere del volumen inicial";
          code = -2;
          throw new Error(error);
        }}
      }} else {{
        const newDoc = await {}.create({{ /* Parameters */ }});
        if (!newDoc) {{
          error = "Error al crear el documento";
          code = -2;
          throw new Error(error);
        }} else {{
          return res.success(newDoc, 200);
        }}
      }}
    }} catch (err) {{
      console.error(err);
      return res.failure(code, "Error interno", 500);
    }}
  }}
}}

// -R-- (Read)
exports.cRead = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure(-3, {{ errors: validationResult.array() }}, 400);
  }} else {{
    const error = null;
    let code = -1;
    let filter = {{
      ...(req.query.deleted === 'true' ? {{ deleted: true }} : {{ deleted: false }}),
      /* More filters here */
    }};
    try {{
     filter = {{
        ...filter,
        ...( req.query.id ? {{ _id: req.query.id}} : {{}}),
        /* More filters here */
      }};
      const document = await {}.findOne(filter);
      return res.success(document, 200);
    }} catch (err) {{
      console.error(err);
      return res.failure(code, "Error interno", 500);
    }}
  }}
}}

// --U- (Update)
exports.cUpdate = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure(-3, {{ errors: validationResult.array() }}, 400);

  }} else {{
    const error = null;
    const code = -1;
    let filter = {{
      ...(req.body.deleted.filter === 'true' ? {{ deleted: true }} : {{}})
    }};

    try {{
      if (req.body.all) {{
        const update = {{
        }}
        const updateResult = await {}.updateMany(
          {{}},
          update,
        );
        if (!updateResult.acknowledged) {{
          error = 'Operation failed';
          code = -2;
          throw new Error(error);
        }} else {{
          return res.success(updateResult, 200);
        }}
      }} else {{
        filter = {{
          ...filter,
        }};
        const update = {{
          /* Your update */
        }};
        const updateResult = await {}.findOneAndUpdate(filter, update, {{new: true}});
        if (!updateResult) {{
          error = 'Operation failed';
          code = -2;
          throw new Error(error);
        }} else {{
          return res.success(updateResult, 200);
        }}
       }}
    }} catch (err) {{
      console.error(err);
      return res.failure(code, "Error interno", err);
    }}
  }}
}}

// ---D (Delete)
exports.cDelete = async (req, res) => {{
  const result = validationResult(req);
  if (!result.isEmpty()) {{
    console.error(`[!] express-validator result is not empty\n\n[!] Errors:\n\t${{result.array()}}`);
    return res.failure(-3, {{errors: result.array()}}, 400);
  }} else {{
    const error = null;
    const code = -1;
    const FILTER = {{ _id: req.query.id }};
    let deletionStatus = null;
    try {{
      if (req.query.hard) {{
        deletionStatus = await _board.findOneAndDelete(FILTER, {{rawResult: true}});
        const deletedDoc = await {}.findOne(FILTER);
        if (!deletedDoc) {{
          return res.success(true, 200);
        }}
      }} else {{
        deletionStatus = await {}.findOneAndUpdate(FILTER, {{ deleted: true }}, {{rawResult: true}})
      }}
      if (!deletionStatus) {{
        error = 'Falló la eliminación';
        code = -2;
        throw new Error(error);
      }} else {{
        if (req.query.hard) {{
          return res.success(true, 200);
        }} else {{
          return res.success(deletionStatus.value, 200);
        }}
      }}
    }} catch(err) {{
      console.error(err);
      return res.failure(code, "Error interno", 500)
    }}
  }}
}}
		]],
    {
      i(1, ""),
      r(1),
      r(1), r(1), r(1), r(1),
      r(1), r(1), r(1)
    })
  ),
  s(
    "route-work", fmt(
     [[
const {{
  //query,
  cCreate,
  cRead,
  cUpdate,
  cDelete,
}} = require("../controllers/{}");

const {{ rateLimiter, isAdmin }} = require("../middlewares/app");

const {{ jwtAuth }} = require("../middlewares/auth.middleware");

module.exports = (application) => {{
  application
    .route("/endpoint/{}")
    .post(rateLimiter, cCreate)
    .get(rateLimiter, cRead)
    .put(rateLimiter, cUpdate)
    .delete(rateLimiter, cDelete);
}};
    ]],
    {
      i(1, "related-name"),
      i(2, "endpoint-url"),
    })
  ),
  s(
    "model-std", fmt(
    [[
const mongoose = require('mongoose');

const {}Schema = new mongoose.Schema(
  {{
  /* Your data */
    deleted: {{ type: Boolean, default: false }},
  }}
  {{
    collection: "{}s",
  }}
)

module.exports = mongoose.model('{}', {}Schema);
  ]],
  {
    i(1, "model-name"),
    r(1), r(1), r(1)
  })
  ),

}
