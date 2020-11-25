"""
    NonlinearSciMLData

A package to automatically download various datasets related to physical experiments on
nonlinear systems.
"""
module NonlinearSciMLData

# Functions
export paper_doi, data_doi, describe, data_path

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
    experiments(dataset)

Return a `Dict{Symbol,String}` of experiments within the dataset.
"""
function experiments end

"""
    experiment(dataset, label)

Return an array of measured inputs and outputs for a particular experiment. The array might
contain nested arrays to indicate where observations have been made under the same
conditions.
"""
function experiment end

"""
    data_path(dataset)

Return the directory containing the dataset.
"""
function data_path(dataset)
    datadep = string(@__MODULE__) * "." * string(nameof(dataset))
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

"""
    register_data(dataset)

Register a particular data dependency.
"""
function register_data end

# Package initialisation
function __init__()
    return init_data()
end

# Actual datasets
include("datasets/NTMD_MSSP_2017.jl")
using ._NTMD_MSSP_2017

const DATASETS = [NTMD_MSSP_2017]

end

# Other datasets
# https://data.bris.ac.uk/data/dataset/15xkehnayh6st11gbc9dmeqg6v
# https://data.bris.ac.uk/data/dataset/1pfqddbxy8ry91n8j5c0cbeqxe
# https://data.bris.ac.uk/data/dataset/1jlp5gsztp3xr2hngpf0q72uii
# https://data.bris.ac.uk/data/dataset/1ttza2mrigjbt2mmbp6raqrxen
