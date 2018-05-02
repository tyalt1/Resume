FROM debian
RUN apt-get update && \
  apt-get install -y build-essential texlive-latex-base git

RUN git config --global user.name 'Tyler Alterio' && \
  git config --global user.email 'tyalt1@gmail.com' && \
  git config --global alias.ls 'log --decorate --oneline --graph -15' && \
  git config --global alias.s 'status --short'
