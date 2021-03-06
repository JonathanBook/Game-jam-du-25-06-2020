local cardsHover = {}

function cardsHover.hover(dt)

    local isDown = love.mouse.isDown(1);

    local action = nil;

    if myFonction.mouse.click() and Tour~='transition' then

        action = "click";

    end
    if #card.hand > 0 then
        for i = #card.hand, 1, -1 do

            value = card.hand[i];

            if (hud.hover(action) == false) then

                --[[ SI ma sourie ne se trouve pas sur un element du Hud ]]

                if myFonction.mouse.hover(value.vector2.x, value.vector2.y, value.width, value.height, value.scale) and
                    Tour ~= "transition" then

                    --[[ Je redonne a la carte sa taille normale  ]]
                    value.scale.x = 1;
                    value.scale.y = 1;

                    if (isDown) then
                        -- DRAG CART MOUSE POSITION
                        value.vector2.y = screen.mouse.Y - (value.height / 2);
                        value.vector2.x = screen.mouse.X - (value.width / 2);
                        break

                    elseif isDown == false then

                        if value.vector2.y <= 400 then

                            --[[ Applique car si elle est deplaser go  moin a 300pixel de haut  ]]

                            if CardAction.Apllique(value) then

                                table.remove(card.hand, i);
                                break;
                            else
                                myFonction.lerp(value.vector2, {
                                    x = value.vector2.x,
                                    y = 600
                                }, 4);
                            end

                        elseif value.vector2.y > 400 then

                            myFonction.lerp(value.vector2, {
                                x = value.vector2.x,
                                y = 600
                            }, 4);

                        end
                    end
                else

                    myFonction.lerp(value.vector2, value.oldVector2, 4);

                    value.scale.x = 0.5;
                    value.scale.y = 0.5;

                end
            else
                
                myFonction.lerp(value.vector2, value.oldVector2, 4);

                value.scale.x = 0.5;
                value.scale.y = 0.5;

            end

        end
    else
        hud.hover(action)
    end
end
return cardsHover;
