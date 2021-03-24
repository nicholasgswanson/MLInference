#!/bin/bash

# Setting options and parameters
control_flag=(${fold_ID} 0 ${n_start} ${image_i} ${learning_rate} ${decay_rate})
echo "the current flag is "
echo ${control_flag[*]}
# Executing the code
module purge

if [ "$USER" == 'andysheu' ]
then
    # module load python/2.7 cuda/10.0 cudnn/7.5
    source activate task_I
    export LD_LIBRARY_PATH=/global/software/sl-7.x86_64/modules/cuda/10.0/cudnn/7.5/lib64:/global/software/sl-7.x86_64/modules/langs/cuda/10.0/lib64
elif [ "$USER" == 'linandrew' ]
then
    source activate env2
    export LD_LIBRARY_PATH=/global/software/sl-7.x86_64/modules/cuda/10.0/cudnn/7.5/lib64:/global/software/sl-7.x86_64/modules/langs/cuda/10.0/lib64
elif [ "$USER" == 'nicholasswanson' ]
then
    module load r r-packages cuda/10.0 cudnn/7.5 openmpi hdf5/1.8.13-intel-ps mil netcdf udunits
    export LD_LIBRARY_PATH=/global/software/sl-7.x86_64/modules/cuda/10.0/cudnn/7.5/lib64:/global/software/sl-7.x86_64/modules/langs/cuda/10.0/lib64
elif [ "$USER" == 'murthy' ]
then
    module load python/2.7 cuda/10.0 cudnn/7.5
    source activate env2
    export LD_LIBRARY_PATH=/global/software/sl-7.x86_64/modules/cuda/10.0/cudnn/7.5/lib64:/global/software/sl-7.x86_64/modules/langs/cuda/10.0/lib64
elif [ "$USER" == 'anruigu' ]
then
    source activate env2
else
    echo "Loading python/2.7.14-anaconda5.0.1 and not activating env"
    module load python/2.7.14-anaconda5.0.1
fi

echo "change to GPU"
cp ./GPU.theanorc ~/.theanorc 

# Create necessary directories, -p means only if it doesn't already exist


start=$SECONDS
R CMD BATCH --no-save EL1.R job.Rout
