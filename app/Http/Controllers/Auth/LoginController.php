<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;

class LoginController extends Controller
{
    use AuthenticatesUsers;
    
    protected $redirectTo = RouteServiceProvider::HOME;

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * Get the login username or email for the authentication.
     *
     * @return string
     */
    public function username()
    {
        $login = request()->input('email');
        if (filter_var($login, FILTER_VALIDATE_EMAIL)) {
            request()->merge(['email' => $login]);
            return 'email';
        } else {
            request()->merge(['username' => $login]);
            return 'username';
        }
    }

    /**
     * Determine if the user should be "remembered" after login.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return bool
     */
    protected function rememberUser(Request $request)
    {
        return $request->has('remember');
    }

    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login(Request $request)
    {
        
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);

        $remember = $this->rememberUser($request); // Check if user should be remembered

        $credentials = $request->only($this->username(), 'password');
        if (Auth::attempt($credentials, $remember)) {
            $request->session()->regenerate();

            // Store remember me cookie if the checkbox is checked
            if ($remember) {
                $rememberToken = Auth::user()->getRememberToken();
                Cookie::queue('remember_token', $rememberToken, 60 * 24 * 30); // Remember for 30 days
            } else {
                // Remove remember me cookie if the checkbox is not checked
                Cookie::queue(Cookie::forget('remember_token'));
            }

            return $this->authenticated($request, Auth::user())
                ?: redirect()->intended($this->redirectPath());
        }

        return $this->sendFailedLoginResponse($request);
    }
}
