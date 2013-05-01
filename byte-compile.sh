#!/bin/bash

LIVE_DIR=packs/live
DEV_DIR=packs/dev
EMACS="emacs -Q"
BATCH_OPTS="-batch -f batch-byte-compile"

# live directory
CLOJURE_PACK_DIR=$LIVE_DIR/clojure-pack/lib
COLOUR_PACK_DIR=$LIVE_DIR/colour-pack/lib
FOUNDATION_PACK_DIR=$LIVE_DIR/foundation-pack/lib
GIT_PACK_DIR=$LIVE_DIR/git-pack/lib
LANG_PACK_DIR=$LIVE_DIR/lang-pack/lib
SNUFKON_PACK_DIR=$LIVE_DIR/snufkon-pack/lib

# dev directory
POWER_PACK_DIR=$DEV_DIR/power-pack/lib

# ロードが必要なライブラリのパスを指定する
EMACS="$EMACS -L $POWER_PACK_DIR/expand-region"
EMACS="$EMACS -L $POWER_PACK_DIR/gh"
EMACS="$EMACS -L $POWER_PACK_DIR/pcache"
EMACS="$EMACS -L $POWER_PACK_DIR/logito"
EMACS="$EMACS -L $POWER_PACK_DIR/multiple-cursors"
EMACS="$EMACS -L $POWER_PACK_DIR/scratch"
EMACS="$EMACS -L $POWER_PACK_DIR/yasnippet"
EMACS="$EMACS -L $CLOJURE_PACK_DIR"
EMACS="$EMACS -L $CLOJURE_PACK_DIR/clojure-mode"
EMACS="$EMACS -L $CLOJURE_PACK_DIR/nrepl"
EMACS="$EMACS -L $CLOJURE_PACK_DIR/auto-complete"
EMACS="$EMACS -L $CLOJURE_PACK_DIR/popup-el"
EMACS="$EMACS -L $COLOUR_PACK_DIR/color-theme"
EMACS="$EMACS -L $FOUNDATION_PACK_DIR"
EMACS="$EMACS -L $FOUNDATION_PACK_DIR/packed"
EMACS="$EMACS -L $FOUNDATION_PACK_DIR/popwin"
EMACS="$EMACS -L $GIT_PACK_DIR/magit"
EMACS="$EMACS -L $LANG_PACK_DIR"
EMACS="$EMACS -L $LANG_PACK_DIR/js2"
EMACS="$EMACS -L $LANG_PACK_DIR/scel"
EMACS="$EMACS -L $SNUFKON_PACK_DIR/emacs-websocket"
EMACS="$EMACS -L $SNUFKON_PACK_DIR/helm"

# コンパイルしないファイルを指定する
IGNORE_FILES=()
IGNORE_FILES+=("$POWER_PACK_DIR/emacs-git-gutter/test-git-gutter.el")
IGNORE_FILES+=("$POWER_PACK_DIR/expand-region/features/support/env.el")
IGNORE_FILES+=("$POWER_PACK_DIR/gh/tests/gh-gist-tests.el")
IGNORE_FILES+=("$POWER_PACK_DIR/gh/tests/gh-issues-tests.el")
IGNORE_FILES+=("$POWER_PACK_DIR/gh/tests/gh-orgs-tests.el")
IGNORE_FILES+=("$POWER_PACK_DIR/gh/tests/gh-tests.el")
IGNORE_FILES+=("$POWER_PACK_DIR/multiple-cursors/features/support/env.el")
IGNORE_FILES+=("$POWER_PACK_DIR/yasnippet/doc/yas-doc-helper.el")
IGNORE_FILES+=("$CLOJURE_PACK_DIR/align-cljlet/align-cljlet-test.el")
IGNORE_FILES+=("$COLOUR_PACK_DIR/color-theme/themes/color-theme-example.el")
IGNORE_FILES+=("$FOUNDATION_PACK_DIR/popwin/misc/popwin-w3m.el")
IGNORE_FILES+=("$FOUNDATION_PACK_DIR/popwin/misc/popwin-yatex.el")
IGNORE_FILES+=("$GIT_PACK_DIR/magit/contrib/magit-inotify.el")
IGNORE_FILES+=("$GIT_PACK_DIR/magit/tests/magit-tests.el")
IGNORE_FILES+=("$LANG_PACK_DIR/glsl-mode/glsl-mode.el")
IGNORE_FILES+=("$SNUFKON_PACK_DIR/emacs-websocket/websocket-test.el")


function ignore_file? () {
    for FILE in "${IGNORE_FILES[@]}"
    do
        if [ "$FILE" = $1 ]; then
            return 0
        fi
    done

    return 1
}

function compile_elisp_files () {
    EL_FILES=`find -L $1 -type f -name "*.el"`
    for EL_FILE in $EL_FILES
    do

        ignore_file? $EL_FILE
        if [ $? -ne 0 ]; then
            $EMACS $BATCH_OPTS $EL_FILE
            if [ $? -ne 0 ]; then
                echo "Compile error is occured."
                echo "File: ${EL_FILE}"
                exit 1
            fi
        else
            echo "Ignore: $EL_FILE"
        fi
    done
}


# コンパイルするディレクトリを指定する
compile_elisp_files $POWER_PACK_DIR
compile_elisp_files $CLOJURE_PACK_DIR
compile_elisp_files $COLOUR_PACK_DIR
compile_elisp_files $FOUNDATION_PACK_DIR
compile_elisp_files $GIT_PACK_DIR
compile_elisp_files $LANG_PACK_DIR
compile_elisp_files $SNUFKON_PACK_DIR
