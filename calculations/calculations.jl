function q1()
    # Part a
    e_o_fe = -0.44 # Volt
    conc_fe = 0.29 # Molar
    n_fe = 2 # Electrons
    e_fe = e_o_fe - 0.059 / n_fe * log10(conc_fe) # Volt
    println("E_Fe = $e_fe V")
    e_o_o2 = 1.23 # Volt
    conc_o2 = 1 # Partial Pressure
    ph = 5.5
    conc_h2 = 10^-ph # Molar
    n_o2 = 4 # Electrons
    e_o2 = e_o_o2 - 0.059 / n_o2 * log10(1 / (conc_o2 * conc_h2^4))
    println("E_O2 = $e_o2 V")
    b_a = 0.1 # V/decade
    b_c = -0.1 # V/decade
    i_o2 = 1E-6 # A/cm^2
    i_fe = 1E-5 # A/cm^2
    i_corr = √(i_o2 * i_fe * 10^((e_fe - e_o2) / b_c))
    println("i_corr = $i_corr A/cm²")
    e_corr = e_o2 + b_c * log10(i_corr / i_o2)
    println("E_corr = $e_corr V")
    # Part b
    e_zn = -1.46 # V
    i_zn = 1e-5 # A/cm^2
    i_prot = √(i_zn * i_o2 * 10^((e_zn - e_o2) / b_c))
    println("i_zn = $i_zn, i_o2 = $i_o2, e_zn = $e_zn, e_o2 = $e_o2, b_c = $b_c")
    println("i_prot = $i_prot A/cm²")
    e_prot = e_o2 + b_c * log10(i_prot / i_o2)
    println("E_prot = $e_prot V")
    i_corr = 10^((e_prot - e_fe) / b_c) * i_fe
    println("i_corr = $i_corr A/cm²")
end

function q2()
    # Part (i)  
    e_o_fe = -0.44 # Volt
    conc_fe = 0.5 # Molar
    n_fe = 2 # Electrons
    e_fe = e_o_fe - 0.059 / n_fe * log10(conc_fe) # Volt
    println("E_Fe = $(round(sigdigits=3, e_fe)) V")
    e_o_o2 = 1.23 # Volt
    ph = [14, 10, 7]
    conc_h2 = 10.0 .^ (.-ph) # Molar
    n_o2 = 4 # Electrons
    e_o2 = @. e_o_o2 - 0.059 / n_o2 * log10(1 / (conc_o2 * conc_h2^4))
    println("E_O2 = $e_o2 V")
    b_a = 0.1 # V/decade
    b_c = -0.1 # V/decade
    i_o2 = 1E-7 # A/cm^2
    i_fe = 1E-5 # A/cm^2
    i_corr = @. √(i_o2 * i_fe * 10^((e_fe - e_o2) / b_c))
    println("i_corr = $(round.(sigdigits=3, i_corr)) A/cm²")
    e_corr = @. e_o2 + b_c * log(i_corr / i_o2)
    println("E_corr = $(round.(sigdigits=3, e_corr)) V")
    # Part (ii)
    i_a = 1e-5 # A / cm^2
    e_prot = e_fe + b_a * log10(i_a / i_fe)
    println("E_prot = $(round.(sigdigits=3, e_prot)) V")
    i_c = @. i_o2 * 10^((e_prot - e_o2) / b_c)
    println("E_prot = $(round.(sigdigits=3, i_c)) A/cm^2")
end

#  q1()
q2()
