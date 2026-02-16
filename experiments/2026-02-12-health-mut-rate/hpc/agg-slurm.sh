#!/bin/bash --login
########## Define Resources Needed with SBATCH Lines ##########

#SBATCH --time=01:00:00             # limit of wall clock time - how long the job will run (same as -t)
#SBATCH --mem=3G                    # memory required per node - amount of memory (in bytes)
#SBATCH --job-name aggregateData    # you can give your job a name for easier identification (same as -J)

########## Command Lines to Run ##########
HPC_ENV_FILE=clipper-hpc-env.sh
PROJECT_NAME=2025-fall-gvsu-symbiosis-mechanisms
REPO_DIR=/mnt/home/kelleyde/research/${PROJECT_NAME}  

source ${HPC_ENV_FILEPATH}
source ${REPO_DIR}/pyenv/bin/activate

RUN_PARAMS="--data_dir /mnt/scratch/lalejina_scratch/kelleyde/data/2025-fall-gvsu-symbiosis-mechanisms/2026-02-12-health-mut-rate/ --dump_dir /research/2025-fall-gvsu-symbiosis-mechanisms/experiments/2026-02-12-health-mut-rate/ --summary_update 500000"

srun python3 ${REPO_DIR}/experiments/2026-02-12-health-mut-rate/analysis/aggregate.py ${RUN_PARAMS}

 