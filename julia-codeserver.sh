curl -fsSL https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-beta3-linux-x86_64.tar.gz -o /tmp/julia.tgz 
sudo tar -xf /tmp/julia.tgz -C /usr/local --strip-components 1
rm /tmp/julia.tgz
julia -e "using Pkg;Pkg.add(\"OhMyREPL\");Pkg.add(\"CodeTracking\");Pkg.add(\"BenchmarkTools\");Pkg.precompile()"
mkdir -p ~/.julia/config
touch ~/.julia/config/startup.jl
echo "using OhMyREPL" > ~/.julia/config/startup.jl
echo "using CodeTracking" >> ~/.julia/config/startup.jl
echo "using BenchmarkTools" >> ~/.julia/config/startup.jl
curl -fsSL https://code-server.dev/install.sh -o install.sh
chmod +x install.sh
source install.sh
mkdir -p ~/.config/code-server
touch ~/.config/code-server/config.yaml
echo "bind-addr: 127.0.0.1:8080" > ~/.config/code-server/config.yaml
echo "auth: none" >> ~/.config/code-server/config.yaml
echo "password: " >> ~/.config/code-server/config.yaml
echo "cert: false" >> ~/.config/code-server/config.yaml
code-server --install-extension julialang.language-julia
code-server --install-extension singularitti.vscode-julia-formatter
sudo systemctl restart code-server@$USER
