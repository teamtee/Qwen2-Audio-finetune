export ASCEND_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
export CUDA_VISIBLE_DEVICES=0,1
LOCAL_DIR=/hpc_stor01/home/yangui.fang_sx/workingspace/project/Qwen2-Audio-finetune-main

## env
export model_path="/hpc_stor01/home/yangui.fang_sx/workingspace/model/Qwen2-Audio"
export train_data_path="./data/aishell-1/asr/test"
export eval_data_path="./data/aishell-1/asr/test"
export lr=1e-4
export seed=1314
export batch_size=1
export device_type="cuda" # npu cuda
export eval_step=2000
export train_epoch=5
export prompt_path="./data/multiprompt.jsonl"
export save_path="./exp/$(date +"%H%M")"
export total_train_steps=100000
export warmup_steps=1000
export wav_type=ark # ark wav
# export train_strategy=fsdp # ddp fsdp
## run
cd $LOCAL_DIR
torchrun \
	--nnodes 1 \
	--nproc_per_node 2 \
	--master_port=29502 \
	./src/train.py