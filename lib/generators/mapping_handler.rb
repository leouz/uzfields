class MappingHandler
  MAPPINGS = [
    { type: "binary",    input: "string",    display: "string"    },
    { type: "boolean",   input: "checkbox",  display: "boolean"   },

    { type: "date",      input: "date",      display: "date"      },
    { type: "datetime",  input: "datetime",  display: "datetime"  },      
    { type: "time",      input: "time",      display: "time"      },
    { type: "timestamp", input: "datetime",  display: "datetime"  },
    
    { type: "decimal",   input: "currency",  display: "currency"  },

    # { type: "float",     input: "number",    display: "number"    },
    { type: "integer",   input: "integer",    display: "number"    },

    { type: "string",    input: "string",    display: "string"    },
    { type: "string",    input: "permalink", display: "link"      },
    { type: "string",    input: "email",     display: "string"    },
    { type: "string",    input: "file",      display: "file"      },
    { type: "string",    input: "image",     display: "image"     },
    { type: "string",    input: "password",  display: nil         },
    
    { type: "text",      input: "text",      display: "text"      },
    { type: "text",      input: "wysi",      display: "wysi"      },
    { type: "string",    input: "select",    display: "string"    },
    { type: "string",    input: "radio",    display: "string"    }
  ]

  def get_mapping_by_type type
    matches = MAPPINGS.select{ |m| m[:type] == type }
    matches.first unless matches.empty?
  end

  def get_mapping_by_input input
    matches = MAPPINGS.select{ |m| m[:input] == input }
    matches.first unless matches.empty?
  end
end