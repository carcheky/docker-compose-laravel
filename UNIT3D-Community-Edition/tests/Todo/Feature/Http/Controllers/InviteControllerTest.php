<?php

namespace Tests\Todo\Feature\Http\Controllers;

use App\Models\Invite;
use App\Models\User;
use Tests\TestCase;

/**
 * @see \App\Http\Controllers\InviteController
 */
class InviteControllerTest extends TestCase
{
    /**
     * @test
     */
    public function create_returns_an_ok_response(): void
    {
        $this->markTestIncomplete('This test case was generated by Shift. When you are ready, remove this line and complete this test case.');

        $user = User::factory()->create();

        $response = $this->actingAs($user)->get(route('invites.create'));

        $response->assertRedirect(withErrors('Invitations Are Disabled Due To Open Registration!'));

        // TODO: perform additional assertions
    }

    /**
     * @test
     */
    public function index_returns_an_ok_response(): void
    {
        $this->markTestIncomplete('This test case was generated by Shift. When you are ready, remove this line and complete this test case.');

        $invite = Invite::factory()->create();
        $user = User::factory()->create();

        $response = $this->actingAs($user)->get(route('invites.index', ['username' => $invite->username]));

        $response->assertOk();
        $response->assertViewIs('user.invites');
        $response->assertViewHas('owner');
        $response->assertViewHas('invites');
        $response->assertViewHas('route');

        // TODO: perform additional assertions
    }

    /**
     * @test
     */
    public function send_returns_an_ok_response(): void
    {
        $this->markTestIncomplete('This test case was generated by Shift. When you are ready, remove this line and complete this test case.');

        $invite = Invite::factory()->create();
        $user = User::factory()->create();

        $response = $this->actingAs($user)->post(route('invites.send', ['id' => $invite->id]), [
            // TODO: send request data
        ]);

        $response->assertRedirect(withErrors('The invite you are trying to resend has already been used.'));

        // TODO: perform additional assertions
    }

    /**
     * @test
     */
    public function store_returns_an_ok_response(): void
    {
        $this->markTestIncomplete('This test case was generated by Shift. When you are ready, remove this line and complete this test case.');

        $user = User::factory()->create();

        $response = $this->actingAs($user)->post(route('invites.store'), [
            // TODO: send request data
        ]);

        $response->assertRedirect(withErrors('Invites are currently disabled for your group.'));

        // TODO: perform additional assertions
    }

    // test cases...
}
