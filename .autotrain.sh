if ! screen -ls | grep -F .retina >/dev/null; then
    export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
    export LC_ALL="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
    export CUDA_VISABLE_DEVICES=0

    cd $HOME/projects/jama16-retina-replication
    model_num=$(find tmp -name "model-?.meta" | wc -l)
    model_num=$((model_num + 1))
    screen -d -m -S retina python train.py -sm=./tmp/model-"$model_num" -ss=./tmp/logs-"$model_num" -sgd
fi