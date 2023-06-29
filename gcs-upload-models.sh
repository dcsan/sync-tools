
# try to sync many files at once using -m
# may complain due to broken google installers try
# https://github.com/GoogleCloudPlatform/gsutil/issues/1427
# pip3 install -U crcmod  #  eg install in system python that gsutil uses

source .env

# bugged/flaky
function syncUpModels() {
    modelType=$1
    echo "syncUpModels $modelType"
    dirpath="./ignored/sync/models/${modelType}"
    gsutil -m rsync -r $dirpath gs://coco-test-8e792.appspot.com/models/$modelType
    echo "DONE syncUpModels $modelType"
}

# slower but seems to work
# might try to redo files?
function upModels() {
    modelType=$1
    dirpath="./ignored/sync/models/${modelType}"
    gsutil -m cp -R $dirpath gs://coco-test-8e792.appspot.com/models
}

# syncUpModels "checkpoints"
# syncUpModels "loras"
# upModels "checkpoints"
# upModels "loras"
