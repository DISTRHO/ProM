/*
 * DISTRHO ProM Plugin
 * Copyright (C) 2014 Filipe Coelho <falktx@falktx.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * For a full copy of the license see the LICENSE file.
 */

#ifndef DISTRHO_UI_3BANDEQ_HPP_INCLUDED
#define DISTRHO_UI_3BANDEQ_HPP_INCLUDED

#include "DistrhoUI.hpp"

class projectM;

START_NAMESPACE_DISTRHO

// -----------------------------------------------------------------------

class DistrhoUIProM : public UI
{
public:
    DistrhoUIProM();
    ~DistrhoUIProM() override;

protected:
    // -------------------------------------------------------------------
    // Information

    uint d_getWidth() const noexcept override
    {
        return 512;
    }

    uint d_getHeight() const noexcept override
    {
        return 512;
    }

    // -------------------------------------------------------------------
    // DSP Callbacks

    void d_parameterChanged(uint32_t, float) override;

    // -------------------------------------------------------------------
    // UI Callbacks

    void d_uiIdle() override;
    void d_uiReshape(int width, int height) override;

    // -------------------------------------------------------------------
    // Widget Callbacks

    void onDisplay() override;
    bool onKeyboard(bool press, uint32_t key) override;
    bool onSpecial(bool press, uint key) override;

private:
    ScopedPointer<projectM> fPM;

    DISTRHO_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(DistrhoUIProM)
};

// -----------------------------------------------------------------------

END_NAMESPACE_DISTRHO

#endif // DISTRHO_UI_3BANDEQ_HPP_INCLUDED
