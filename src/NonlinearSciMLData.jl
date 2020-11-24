"""
    NonlinearSciMLData

A package to automatically download various datasets related to physical experiments on
nonlinear systems.
"""
module NonlinearSciMLData

# Functions
export paper_doi, data_doi, describe, data_dir

# Datasets
export NTMD_MSSP_2017

# Dependencies
using DataDeps: DataDeps, register, DataDep, unpack
using MAT: MAT

"""
    paper_doi(dataset)

Return the DOI of the paper associated with the data.
"""
function paper_doi end

"""
    data_doi(dataset)

Return the DOI of the data.
"""
function data_doi end

"""
    describe(dataset)

Return a short description of the dataset.
"""
function describe end

"""
    data_dir(dataset)

Return the directory containing the dataset.
"""
function data_dir(dataset)
    datadep = "NonlinearSciML."*string(nameof(dataset))
    return DataDeps.@datadep_str datadep
end

"""
    init_data()

Register all the data dependencies with DataDeps.jl.
"""
function init_data()
    for dataset in DATASETS
        register_data(dataset)
    end
end

# Package initialisation
function __init__()
    return init_data()
end

# Actual datasets
include("datasets/NTMD_MSSP_2017.jl")

const DATASETS = [NTMD_MSSP_2017]

end
