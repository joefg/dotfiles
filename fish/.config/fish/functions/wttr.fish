function wttr --description "Show the weather for your town."
    curl -s "https://wttr.in/$argv";
end

function vwttr --description "Show more verbose weather for your town."
    curl -s "https://v2.wttr.in/$argv";
end

function qwttr --description "Show the weather for your town."
    curl -s "https://wttr.in/$argv" | head -7;
end
