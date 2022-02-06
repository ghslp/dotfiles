# ============
# === Base ===
# ============

# Note: Throughout this file paths prefixed with /usr/local are for Homebrew
# installed on an Intel Mac, while paths prefixed with /opt/homebrew are for
# Homebrew installed on an Apple Silicon Mac. In most cases I include both to be
# safe.
#
# I don’t have an Apple Silicon Mac so this isn’t tested yet.

set -x PATH "$HOME/bin" "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" "/opt/homebrew/bin" "/usr/local/bin" "/opt/homebrew/opt/gettext/bin" "/usr/local/opt/gettext/bin" $PATH

set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/homebrew/opt/icu4c/lib/pkgconfig /usr/local/opt/icu4c/lib/pkgconfig

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Load environment from .env.local
#
# This function isn’t necessary for newer Next.js projects (which automatically
# load .env.local on build/start)
function source_env_local
    bass "set -o allexport; source ./.env.local; set +o allexport"
end

# ==================
# === JavaScript ===
# ==================

# Via https://github.com/jorgebucaran/nvm.fish/issues/122#issuecomment-727248662
function activate_directory_node_version --on-variable PWD
    if type -q nvm
        test -e $PWD/.nvmrc || test -e $PWD/.node-version && nvm install
    else
        echo "NOTE: Install nvm.fish to automatically source activate the Node version specified in `.node-version` when entering a directory (https://gitlab.notofilter.com/development/guidelines/-/blob/master/frontend/README.markdown#fish-shell)"
    end
end

# Call immediately in case shell opened to directory containing `.node-version`
activate_directory_node_version
