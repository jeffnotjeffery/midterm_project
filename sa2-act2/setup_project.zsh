#!/bin/zsh
base_directory="research_project"
mkdir -p "$base_directory"/{data,analysis,results,documentation} 

echo "Sample data for experiment 1" > "$base_directory/data/experiment1_data.txt"
echo "Initial analysis of experiment 1" > "$base_directory/analysis/experiment1_analysis.txt"
echo "Preliminary results from experiment 1" > "$base_directory/results/experiment1_results.txt"
echo "Project Description and Methodology" > "$base_directory/documentation/project_overview.txt"