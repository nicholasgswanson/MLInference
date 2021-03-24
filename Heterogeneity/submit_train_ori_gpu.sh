#!/bin/bash
#SBATCH --job-name=test_of_reproduce

### Set number of nodes and cores per node; reserve GPU(s) and set compute mode
#SBATCH --nodes=1

### Set maximum walltime
### must set 2x the number GPUs as cpus
#SBATCH --cpus-per-task=4

#from the Berkeley it instructions
#SBATCH --gres=gpu:2
#SBATCH --ntasks=1

#SBATCH --time=72:00:00

#SBATCH --account=fc_slums

### Define the special resource queue within CyberLAMP for accessing single-GPU nodes
#SBATCH --partition=savio2_gpu
#SBATCH --qos=savio_normal
 
#SBATCH --mail-type=ALL
$SBATCH --mail-user=nicholas.swanson@berkeley.edu


chmod +x train_ori_gpu.sh
./train_ori_gpu.sh

echo " "
echo "Job ended at `date`"
echo " "
