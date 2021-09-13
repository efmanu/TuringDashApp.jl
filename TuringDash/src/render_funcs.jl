function render_all()
    return dbc_container([
        dbc_row([
            render_info()
        ]),
        dbc_row([
            render_func_init(),
            dbc_col([
                dbc_button("Sample !", color="success", id="dtu-btn-turing")
            ], md =2),            
            render_plots()
        ])
    ])
end
function render_info()
    return dbc_col([
        dbc_jumbotron([
            html_h1("Dash Turing App", className="dtu-display-3"),
            html_p(
                "Web app for Bayesian inference using  Dash.jl and Turing.jl ",
                className="lead",
            ),
            html_hr(className="my-2"),
            html_p(
                "User can define Turing model",
            )
        ])
    ])
end
function render_func_init()
    return dbc_col([
        html_div([
            render_uploader(),
            render_function(),        
            render_init()
        ]),        
    ], md=5)
end
function render_function()
    return dbc_card([
        dbc_cardbody([
            html_h4("Model specification", className="card-title"),
            html_div([
                dbc_textarea(
                    id = "dtu-user-funcs",
                    bs_size="lg",
                    className="mb-3",
                    rows  = 6,
                    value="""
                        @model turingmodel(x, y) = begin
                            a ~ Normal()
                            b ~ Normal()
                            for i in 1:length(x)
                                y[i] ~ Normal(a + b * x[i], 1.0)
                            end
                        end
                    """,
                )
            ]),
        ])
    ])
end
function render_init()
    return dbc_card([
            dbc_cardbody([
                html_h4("Conditional Model", className="card-title"),
                html_div([
                    dbc_input(
                        id = "dtu-user-func-init",
                        bs_size="lg",
                        className="mb-3",
                        value="turingmodel(x, y)",
                    )
                ]),
            ])
        ])
end
function render_uploader()
    return dbc_card([
            dbc_cardbody([
                html_h4("Select Data", className="card-title"),
                html_div([
                    html_div(
                        id="dtu-def-upload-data",
                        [
                        html_label("Select a default dataset:")
                        dcc_dropdown(
                            id="dtu-def-data-drop",
                            options =[
                                Dict("label" => "Select Data", "value" => "0"),
                                Dict("label" => "Data 1", "value" => "1"),
                                Dict("label" => "Data 2", "value" => "2"),
                                Dict("label" => "Data 3", "value" => "3")
                            ],
                            value="0"
                            )
                        ],
                    ),
                    html_h3("OR"),
                    dcc_upload(
                        id="dtu-upload-datan",
                        children=html_div([
                            "Drag and Drop or ",
                            html_a("Select Files")
                        ]),
                        style=Dict(
                            "width" => "100%",
                            "height" => "60px",
                            "lineHeight" => "60px",
                            "borderWidth" => "1px",
                            "borderStyle" => "dashed",
                            "borderRadius" => "5px",
                            "textAlign" => "center",
                            "margin" => "10px"
                        ),
                        # Allow multiple files to be uploaded
                        multiple=false
                    )
                ]),
            ])
        ])
end

function render_liveupdates()
    global x_graph
    global y_graph
    return html_div([
        html_h3("Plots"),
        dcc_interval(
            id="interval-component",
            interval=500, # in milliseconds
            n_intervals=0,
            disabled=false
        ),
        dcc_graph(id="dtu-params-state1",
            figure=Dict(
                "data" => [
                    Dict("x" => x_graph, "y" => y_graph),
                ]
            )
        ),
        dcc_graph(id="dtu-params-state2",
            figure=Dict(
                "data" => [
                    Dict("x" => x_graph, "y" => y_graph1),
                ]
            )
        )
    ])
end
function render_plots()
    return dbc_col(id="dtu-params-plot-loc", md =5)
end