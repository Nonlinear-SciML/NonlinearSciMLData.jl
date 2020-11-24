# Control-based continuation: Bifurcation and stability analysis for physical experiments
# David A.W. Barton
# Mechanical Systems and Signal Processing, Volume 84, Part B, 1 February 2017, Pages 54-64

struct NTMD_MSSP_2017 end

paper_doi(::Type{NTMD_MSSP_2017}) = "https://doi.org/10.1016/j.ymssp.2015.12.039"
data_doi(::Type{NTMD_MSSP_2017}) = "https://doi.org/10.5523/bris.1esk6h8klq0bg1gdcr78a2ypyz"

function describe(::Type{NTMD_MSSP_2017})
    return "Experimental data associated with the paper \"Control-based continuation: bifurcation and stability analysis for physical experiments\" by David A.W. Barton"
end

function register_data(::Type{NTMD_MSSP_2017})
    return register(DataDep(
        "NonlinearSciMLData.NTMD_MSSP_2017",
        describe(NTMD_MSSP_2017),
        "http://data.bris.ac.uk/datasets/1esk6h8klq0bg1gdcr78a2ypyz/2015_MSSP_Barton.zip",
        "711bb90e42c4cdbf3c98829108b84489e39801f567868d6096a24361672a40f5";
        post_fetch_method=unpack,
    ))
end
