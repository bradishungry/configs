export TERM=xterm-256color

alias ls='ls -G'
alias tmux="tmux -2"

export PATH="$PATH:$HOME/.rvm/bin"

export CARGO_HOME="$HOME/.cargo"

export PATH="$HOME/.cargo/bin:$PATH"

#Vulkan SDK
export VULKAN_SDK=$HOME/vulkan_sdk/macOS
export PATH=$VULKAN_SDK/bin:$PATH
export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
export VK_ICD_FILENAMES=$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d
