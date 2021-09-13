function eval_definition(fn, init_val, lb, ub)
    return (
        eval(Meta.parse(fn)),
        eval(Meta.parse(init_val)),
        eval(Meta.parse(lb)),
        eval(Meta.parse(ub))
    )
end

function parse_contents(contents, filename)
    content_type, content_string = split(contents, ',')
    decoded = base64decode(content_string)
    df = DataFrame()
    try
      if occursin("csv", filename)
        str = String(decoded)
        df =  CSV.read(IOBuffer(str), DataFrame)
      end
    catch e
      print(e)
      return html_div([
          "There was an error processing this file."
      ])
    end
     #shuffle data
     n_row = nrow(df)
     shuffle_data = df[shuffle(1:n_row)[:], :]
     shuffle_data[!,"id"] = 1:n_row
    return shuffle_data
  end

  function load_default(val)
    if val == "1"
      df = CSV.read(download("https://raw.githubusercontent.com/efmanu/TuringDashApp.jl/master/TuringDash/datasets/data1.csv"), DataFrame)
    elseif val =="2"
      df = CSV.read(download("https://raw.githubusercontent.com/efmanu/TuringDashApp.jl/master/TuringDash/datasets/data2.csv"), DataFrame)
    else
      df = CSV.read(download("https://raw.githubusercontent.com/efmanu/TuringDashApp.jl/master/TuringDash/datasets/data3.csv"), DataFrame)
    end
    return df
  end