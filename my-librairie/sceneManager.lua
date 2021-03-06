local scene = {};

-- REQUIRE
scene.start = require("scene/start");
scene.gameplay = require("scene/gameplay");
scene.option = require("scene/option");
scene.credit = require("scene/credit");
scene.menu = require("scene/menu");

scene.liste = {

    startGame = {},
    menu = {},
    gmaePlay = {},
    credit = {},
    option = {}

};
scene.curent = "Menu";

function scene.load()

    if (scene.curent == "gameplay") then

        scene.gameplay.load();
    elseif scene.curent == "Menu" then
        scene.menu.load();
    end

end

function scene.update(dt)
    if (scene.curent == "gameplay") then

        scene.gameplay.update(dt);

    elseif scene.curent == "Menu" then

        scene.menu.update(dt);
    end
end

function scene.draw()
    if (scene.curent == "gameplay") then

        scene.gameplay.draw();
    elseif scene.curent == "Menu" then
        scene.menu.draw();
    end

end
return scene
