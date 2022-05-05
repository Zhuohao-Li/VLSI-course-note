% =========================================================================
% Title       : Demodulation of Simulation for OFDM IEEE 802.11a
% File        : ofdmdemod.m
% -------------------------------------------------------------------------
% Description :
%   This file demodulates the data for OFDM system
% -------------------------------------------------------------------------
% Revisions   :
%   Date                 Author            Description
%   24-Apr-2022    Jiaxin Lyu        file adapted from large sim-environment
% -------------------------------------------------------------------------
%   Author: Jiaxin Lyu (e-mail: ljx981120@sjtu.edu.cn)
% =========================================================================

function data_out = ofdmdemod(data_in, OFDM)
   % initialize the tx signal
    data_out = zeros(OFDM.para, OFDM.Nd * OFDM.mod_lev);
    switch (OFDM.mod_lev)
        case 1 % BPSK
            data_out = real(data_in) > 0;
        case 2 % 4-QAM / QPSK
           data_in_i = real(data_in);
           data_in_q = imag(data_in);
           data_out(:, 1 : 2 : end - 1) = data_in_i > 0;
           data_out(:, 2 : 2 : end) = data_in_q > 0;
        case 4 % 16-QAM
           data_in_i = real(data_in);
           data_in_q = imag(data_in);
           data_out(:, 1 : 4 : end - 3) = data_in_i > 0;
           data_out(:, 2 : 4 : end - 2) = abs(data_in_i) > 0;
           data_out(:, 3 : 4 : end - 1) = data_in_q > 0;
           data_out(:, 4 : 4 : end - 0) = abs(data_in_q) > 0;
        case 6 % 64-QAM
            data in i = real(data in); 
            data_in_q = imag(data_in);
            data_out(:, 1 : 6 : end - 5) = data_in_i > 0; 
            data_out(:, 2 : 6 : end - 4) = abs(data_in_i) < 4;
            data_out(:, 3 : 6 : end - 3) = (abs(data_in_i) > 2) & (abs(data_in_i) < 6); 
            data_out(:, 4 : 6 : end - 2) = data_in_q > 0; 
            data_out(:, 5 : 6 : end - 1) = abs(data_in_q) < 4;
            data_out(:, 6 : 6 : end - 1) = (abs(data_in_q) > 2) & (abs(data_in_q) < 6);
        otherwise
            error('Modulation order for 11a mapping not supported.')
    end

    return
