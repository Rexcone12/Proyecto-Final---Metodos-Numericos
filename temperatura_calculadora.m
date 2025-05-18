function temperatura_equilibrio()
    % Solicitar datos al usuario
    m1 = input('Ingrese la masa del cuerpo 1 (kg): ');
    c1 = input('Ingrese la capacidad calorífica del cuerpo 1 (J/kg·°C): ');
    T1 = input('Ingrese la temperatura inicial del cuerpo 1 (°C): ');
    
    m2 = input('Ingrese la masa del cuerpo 2 (kg): ');
    c2 = input('Ingrese la capacidad calorífica del cuerpo 2 (J/kg·°C): ');
    T2 = input('Ingrese la temperatura inicial del cuerpo 2 (°C): ');
    
    % Parámetros del método
    T0 = input('Ingrese la estimación inicial para T_f (°C): ');
    tol = input('Ingrese la tolerancia deseada: ');
    max_iter = input('Ingrese el número máximo de iteraciones: ');
    
    % Definir la función y su derivada
    f = @(Tf) m1*c1*(Tf - T1) + m2*c2*(Tf - T2);
    df = @(Tf) m1*c1 + m2*c2;
    
    % Inicializar variables
    iter = 0;
    error = inf;
    
    fprintf('\nIteración\tT_f\t\tError\n');
    while error > tol && iter < max_iter
        Tf_new = T0 - f(T0)/df(T0);
        error = abs(Tf_new - T0);
        iter = iter + 1;
        fprintf('%d\t\t%.6f\t%.6f\n', iter, Tf_new, error);
        T0 = Tf_new;
    end
    
    if error <= tol
        fprintf('\nLa temperatura de equilibrio es: %.6f °C\n', Tf_new);
    else
        fprintf('\nNo se alcanzó la convergencia en %d iteraciones.\n', max_iter);
    end
end
