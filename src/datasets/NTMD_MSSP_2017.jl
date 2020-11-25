"""
Control-based continuation: Bifurcation and stability analysis for physical experiments
David A.W. Barton
Mechanical Systems and Signal Processing, Volume 84, Part B, 1 February 2017, Pages 54-64
"""
module _NTMD_MSSP_2017

export NTMD_MSSP_2017

using ..NonlinearSciMLData: NonlinearSciMLData, describe
using DataDeps: register, DataDep, unpack

struct NTMD_MSSP_2017 end

function NonlinearSciMLData.paper_doi(::Type{NTMD_MSSP_2017})
    return "https://doi.org/10.1016/j.ymssp.2015.12.039"
end
function NonlinearSciMLData.data_doi(::Type{NTMD_MSSP_2017})
    return "https://doi.org/10.5523/bris.1esk6h8klq0bg1gdcr78a2ypyz"
end

function NonlinearSciMLData.describe(::Type{NTMD_MSSP_2017})
    return "Experimental data associated with the paper \"Control-based continuation: bifurcation and stability analysis for physical experiments\" by David A.W. Barton"
end

function NonlinearSciMLData.experiments(::Type{NTMD_MSSP_2017})
    return Dict(
        :E1ai =>
            "Stable orbit. Uncontrolled with random inputs. Variety of random amplitudes [0.1:0.1:0.5] x 20 sec x 10 replicates.",
        :E1aii =>
            "Stable orbit. Uncontrolled with random inputs. A long time capture (2 minutes) x2.",
        :E1bi =>
            "Stable orbit. Controlled with random inputs. Variety of random amplitudes [0.1:0.1:0.5] x 20 sec x 10 replicates.",
        :E1bii =>
            "Stable orbit. Controlled with random inputs. A long time capture (2 minutes) x2.",
        :E2bi =>
            "Unstable orbit. Controlled with random inputs. Variety of random amplitudes [0.1:0.1:0.5] x 20 sec x 10 replicates.",
        :E2bii =>
            "Unstable orbit. Controlled with random inputs. A long time capture (2 minutes) x2.",
        :E2ci =>
            "Unstable orbit. Uncontrolled release followed by return to control. 40 replicates.",
        :E3a =>
            "Continuation of a single branch. Variety of random amplitudes [0.1, 0.3, 0.5] x 20 sec.",
        :E3b =>
            "Continuation of a single branch. Several replicates for fixed random amplitude (0.5).",
        :E4 => "Continuation of the full surface.",
    )
end

function get_meta(data)
    timestamp = DateTime(floor.(Int, data["timestamp_created"])...)
    fourier = data["fourier"]
end

function get_observations(data)
    # base is the input
    # x is the output

    # unfortunately it would have been better to have an accelerometer on the base rather than a displacement sensor...
end

function NonlinearSciMLData.experiment(::Type{NTMD_MSSP_2017}, label::Symbol)
    if label === :E1ai
    elseif label === :E1aii
    elseif label === :E1bi
    elseif label === :E1bii
    elseif label === :E2bi
    elseif label === :E2bii
    elseif label === :E2ci
    elseif label === :E2cii
    end
end

function NonlinearSciMLData.register_data(::Type{NTMD_MSSP_2017})
    return register(DataDep(
        string(nameof(NonlinearSciMLData)) * "." * string(nameof(NTMD_MSSP_2017)),
        describe(NTMD_MSSP_2017),
        "http://data.bris.ac.uk/datasets/1esk6h8klq0bg1gdcr78a2ypyz/2015_MSSP_Barton.zip",
        "711bb90e42c4cdbf3c98829108b84489e39801f567868d6096a24361672a40f5";
        post_fetch_method=unpack,
    ))
end

end
