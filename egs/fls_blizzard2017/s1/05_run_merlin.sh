#!/bin/bash -e

global_config_file=conf/global_settings.cfg
source $global_config_file

#if test "$#" -ne 2; then
#    echo "################################"
#    echo "Usage: "
#    echo "./05_run_merlin.sh <path_to_test_dur_conf_file> <path_to_test_synth_conf_file>"
#    echo ""
#    echo "Default path to test duration conf file: conf/test_dur_synth_${Voice}.conf"
#    echo "Default path to test synthesis conf file: conf/test_synth_${Voice}.conf"
#    echo "################################"
#    exit 1
#fi

test_synth_config_file=conf/test_synth_merlin-benchmark.conf


echo "synthesizing acoustic only..."
./scripts/submit.sh ${MerlinDir}/src/run_merlin.py $test_synth_config_file >> acoustic_test_log.txt 2>&1

echo "deleting intermediate synthesis files..."
./scripts/remove_intermediate_files.sh $global_config_file

echo "synthesized audio files are in: experiments/merlin-benchmark/test_synthesis/wav"
echo "All successfull!! Your demo voice is ready :)"

