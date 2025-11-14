-- Sistema de salud básico
local saludMaxima = 100
local saludActual = saludMaxima

function recibirDanio(danio)
    saludActual = saludActual - danio
    if saludActual < 0 then saludActual = 0 end
    print("Daño recibido: " .. danio)
    print("Salud actual: " .. saludActual)
end

function curarse(cura)
    saludActual = saludActual + cura
    if saludActual > saludMaxima then saludActual = saludMaxima end
    print("Curación: " .. cura)
    print("Salud actual: " .. saludActual)
end

-- Simulación
recibirDanio(30)
curarse(20)
recibirDanio(50)
curarse(100)
